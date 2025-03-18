package com.example.create_order_app

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.media.MediaPlayer
import android.media.RingtoneManager
import android.media.AudioAttributes
import android.net.Uri
import android.os.Build
import android.os.IBinder
import android.util.Log
import androidx.core.app.NotificationCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.BroadcastReceiver
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger
import java.util.concurrent.atomic.AtomicBoolean
class MainActivity : FlutterActivity() {
    private val CHANNEL = "order_alarm"

    companion object {
        var methodChannel: MethodChannel? = null
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "playAlarm" -> {
                    val channelId = call.argument<String>("channelId") ?: "alarm_channel"
                    val notificationId = call.argument<String>("notificationId") ?: "alarm_channel"
                    val intent = Intent(this, AlarmService::class.java)
                    intent.putExtra("channel_id", channelId)
                    intent.putExtra("notification_id", notificationId)
                    startForegroundService(intent)
                    result.success(null)
                }
                "stopAlarm" -> {
                    val intent = Intent(this, AlarmService::class.java)
                    stopService(intent)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }
}

class AlarmService : Service() {
    private var mediaPlayer: MediaPlayer? = null
    private var channelId: String = "alarm_channel"
    private var notificationId: String = "alarm_channel"

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        stopAlarm()
        channelId = "alarm_channel"
        notificationId = intent?.getStringExtra("notification_id") ?: "alarm_channel"

        createNotificationChannel()

        mediaPlayer = MediaPlayer.create(this, R.raw.alarm_sound).apply {
            isLooping = true
            start()
        }

        val notification = createNotification()
        startForeground(notificationId.hashCode(), notification)

        // Create a summary notification to keep them grouped
        createSummaryNotification()

        return START_STICKY
    }

    override fun onDestroy() {
        stopAlarm()
        super.onDestroy()
    }

    override fun onTaskRemoved(rootIntent: Intent?) {
        stopAlarm()
        stopSelf()
    }

    private fun stopAlarm() {
        stopForeground(false)
        mediaPlayer?.stop()
        mediaPlayer?.release()
        mediaPlayer = null
    }

    private fun createNotification(): android.app.Notification {
        createNotificationChannel()
        val uniqueCode = notificationId.hashCode()

        val contentIntent = Intent(this, AcknowledgeReceiver::class.java).apply {
            action = "com.example.create_order_app.ACTION_ACKNOWLEDGE"
            putExtra("channel_id", notificationId)
            putExtra("notification_id", notificationId)
        }
        val contentPendingIntent = PendingIntent.getBroadcast(
            this, uniqueCode, contentIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val ackIntent = Intent(this, AcknowledgeReceiver::class.java).apply {
            action = "com.example.create_order_app.ACTION_ACKNOWLEDGE"
            putExtra("channel_id", channelId)
            putExtra("notification_id", notificationId)
        }
        val ackPendingIntent = PendingIntent.getBroadcast(
            this, uniqueCode + 1, ackIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val deleteIntent = Intent(this, NotificationDeleteReceiver::class.java)
        val deletePendingIntent = PendingIntent.getBroadcast(
            this, uniqueCode + 2, deleteIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        return NotificationCompat.Builder(this, "newOne")
            .setContentTitle("New Order Arrived: $notificationId")
            .setContentText("Tap anywhere to acknowledge and stop the alarm.")
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentIntent(contentPendingIntent)
            .addAction(0, "Acknowledge", ackPendingIntent)
            .setDeleteIntent(deletePendingIntent)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_ALARM)
            .setDefaults(NotificationCompat.DEFAULT_ALL)
            .setGroup("Order")
            .setVibrate(longArrayOf(0, 500, 500, 500))
            .build()
    }

    private fun createSummaryNotification() {
        val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        val summaryNotification = NotificationCompat.Builder(this, "newOne")
            .setContentTitle("New Orders")
            .setContentText("You have new orders pending")
            .setSmallIcon(R.mipmap.ic_launcher)
            .setGroup("Order")
            .setGroupSummary(true)  // Summary notification for grouping
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .build()

        notificationManager.notify(0, summaryNotification)  // Always use ID 0 for summary
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channelId = "newOne"
            val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

            val existingChannel = notificationManager.getNotificationChannel(channelId)
            if (existingChannel == null) {
                val channelName = "Alarm Notifications"
                val importance = NotificationManager.IMPORTANCE_HIGH
                val channel = NotificationChannel(channelId, channelName, importance).apply {
                    description = "Channel for alarm notifications"
                    enableVibration(true)
                    vibrationPattern = longArrayOf(0, 500, 500, 500)
                }
                notificationManager.createNotificationChannel(channel)
            }
        }
    }

    override fun onBind(intent: Intent?): IBinder? = null
}

class AcknowledgeReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        Log.d("AcknowledgeReceiver", "Acknowledge button pressed, stopping alarm service")

        val stopIntent = Intent(context, AlarmService::class.java)
        context?.stopService(stopIntent)

        val notificationId = intent?.getStringExtra("notification_id") ?: "alarm_channel"

        // Remove notification on acknowledge
        val notificationManager = context?.getSystemService(Context.NOTIFICATION_SERVICE) as? NotificationManager
        notificationManager?.cancel(notificationId.hashCode())

        // Send acknowledgment message to Flutter
        MainActivity.methodChannel?.invokeMethod("acknowledged", mapOf("notificationId" to notificationId))
    }
}

class NotificationDeleteReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        Log.d("NotificationDelete", "Notification dismissed, stopping service")
        context?.stopService(Intent(context, AlarmService::class.java))
    }
}


