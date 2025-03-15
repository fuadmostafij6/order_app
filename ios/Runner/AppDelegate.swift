// AppDelegate.swift

import UIKit
import Flutter
import AVFoundation
import UserNotifications

@main
@objc class AppDelegate: FlutterAppDelegate {
    private let CHANNEL = "order_alarm"
    private var audioPlayer: AVAudioPlayer?
    private var notificationCenter = UNUserNotificationCenter.current()
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
        
        channel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
            switch call.method {
            case "playAlarm":
                let args = call.arguments as? [String: Any]
                let channelId = args?["channelId"] as? String ?? "alarm_channel"
                self?.requestNotificationPermission { granted in
                    if granted {
                        print("Notification permission granted")
                        self?.playAlarm(channelId: channelId)
                        self?.scheduleNotification(channelId: channelId)
                        result(nil)
                    } else {
                        result(FlutterError(code: "PERMISSION_DENIED",
                                            message: "Notification permission required",
                                            details: nil))
                    }
                }

            case "stopAlarm":
                self?.stopAlarm()
                result(nil)

            default:
                result(FlutterMethodNotImplemented)
            }
        }

        notificationCenter.delegate = self
        configureAudioSession()
        setupNotificationCategories()

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func setupNotificationCategories() {
        let acknowledgeAction = UNNotificationAction(
            identifier: "ACKNOWLEDGE_ACTION",
            title: "Acknowledge",
            options: [.foreground]
        )

        let category = UNNotificationCategory(
            identifier: "ALARM_CATEGORY",
            actions: [acknowledgeAction],
            intentIdentifiers: [],
            options: [.customDismissAction]
        )

        notificationCenter.setNotificationCategories([category])
    }

    private func requestNotificationPermission(completion: @escaping (Bool) -> Void) {
        notificationCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized, .provisional:
                completion(true)
            case .notDetermined:
                self.notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
                    DispatchQueue.main.async {
                        completion(granted)
                    }
                }
            default:
                completion(false)
            }
        }
    }

    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(
                .playback,
                mode: .default,
                options: [.mixWithOthers, .duckOthers]
            )
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Audio session setup error: \(error.localizedDescription)")
        }
    }

    private func playAlarm(channelId: String) {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else {
            print("Sound file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Audio player error: \(error.localizedDescription)")
        }
    }

    private func stopAlarm() {
        audioPlayer?.stop()
        audioPlayer = nil
        removePendingNotifications()
    }

    private func scheduleNotification(channelId: String) {
        let content = UNMutableNotificationContent()
        content.title = "New Order Arrived: \(channelId)"
        content.body = "Tap to acknowledge and stop the alarm."
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "alarm_sound.mp3"))
        content.categoryIdentifier = "ALARM_CATEGORY"
        content.userInfo = ["notificationID": channelId]

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)
        let request = UNNotificationRequest(
            identifier: channelId,
            content: content,
            trigger: trigger
        )

        notificationCenter.add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error.localizedDescription)")
            }
        }
    }

    private func removePendingNotifications() {
        notificationCenter.removeAllPendingNotificationRequests()
        notificationCenter.removeAllDeliveredNotifications()
    }

    // Handle notification interactions
    override func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        let channelId = response.notification.request.identifier

        switch response.actionIdentifier {
        case "ACKNOWLEDGE_ACTION", UNNotificationDefaultActionIdentifier:
            stopAlarm()
            if let controller = window?.rootViewController as? FlutterViewController {
                let channel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
                channel.invokeMethod("acknowledged", arguments: ["notificationId": channelId])
            }

        case UNNotificationDismissActionIdentifier:
            stopAlarm()

        default:
            break
        }

        completionHandler()
    }

    // Handle foreground notifications
    override func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        // Show banner and play sound even in foreground
        if #available(iOS 14.0, *) {
            completionHandler([.banner, .list, .sound])
        } else {
            completionHandler([.alert, .sound])
        }
    }
}