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
class MainActivity : FlutterActivity() {
    private val CHANNEL = "order_alarm"

    companion object {
        // Save a reference so you can send messages later (see step 2)
        var methodChannel: MethodChannel? = null
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        methodChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "playAlarm" -> {
                    // Get the channel id sent from Flutter (or default)
                    val channelId = call.argument<String>("channelId") ?: "alarm_channel"
                    val intent = Intent(this, AlarmService::class.java)
                    intent.putExtra("channel_id", channelId)
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

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        stopAlarm()
        // Retrieve channel id passed from Flutter
        channelId = intent?.getStringExtra("channel_id") ?: "alarm_channel"

        // Create notification channel using the provided channel id
        createNotificationChannel()

        // Initialize and start the looping MediaPlayer
        mediaPlayer = MediaPlayer.create(this, R.raw.alarm_sound).apply {
            isLooping = true
            start()
        }

        // Start as foreground service with a notification that uses channelId
        startForeground(1, createNotification())
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
        // Convert channelId (a String) to a unique integer code
        val uniqueCode = channelId.hashCode()

        val contentIntent = Intent(this, AcknowledgeReceiver::class.java).apply {
            action = "com.example.create_order_app.ACTION_ACKNOWLEDGE"
            putExtra("channel_id", channelId)
        }
        val contentPendingIntent = PendingIntent.getBroadcast(
            this,
            uniqueCode,
            contentIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        // Action button intent
        val ackIntent = Intent(this, AcknowledgeReceiver::class.java).apply {
            action = "com.example.create_order_app.ACTION_ACKNOWLEDGE"
            putExtra("channel_id", channelId)
        }
        val ackPendingIntent = PendingIntent.getBroadcast(
            this,
            uniqueCode + 1, // Different unique code
            ackIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        // Delete intent: for when the user dismisses the notification
        val deleteIntent = Intent(this, NotificationDeleteReceiver::class.java)
        val deletePendingIntent = PendingIntent.getBroadcast(
            this,
            uniqueCode + 2, // Another unique code
            deleteIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        return NotificationCompat.Builder(this, channelId)
            .setContentTitle("New Order Arrived: $channelId")
            .setContentText("Tap anywhere to acknowledge and stop the alarm.")
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentIntent(contentPendingIntent) // This handles taps on the notification body
            .addAction(0, "Acknowledge", ackPendingIntent) // Optional explicit button
            .setDeleteIntent(deletePendingIntent)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setCategory(NotificationCompat.CATEGORY_ALARM)
            .setDefaults(NotificationCompat.DEFAULT_ALL)
            .setVibrate(longArrayOf(0, 500, 500, 500))
            .build()
    }


    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channelName = "Alarm Notifications"
            val importance = NotificationManager.IMPORTANCE_HIGH
            val channel = NotificationChannel(channelId, channelName, importance).apply {
                description = "Channel for alarm notifications"
                enableVibration(true)
                vibrationPattern = longArrayOf(0, 500, 500, 500)
            }
            val notificationManager = getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }
    }

    override fun onBind(intent: Intent?): IBinder? = null
}


class AcknowledgeReceiver : BroadcastReceiver() {
    private var channelId: String = "alarm_channel"
    override fun onReceive(context: Context?, intent: Intent?) {
        Log.d("AcknowledgeReceiver", "Acknowledge button pressed, stopping alarm service")
        // Stop the alarm service
        val stopIntent = Intent(context, AlarmService::class.java)
        context?.stopService(stopIntent)


        channelId = intent?.getStringExtra("channel_id") ?: "alarm_channel"
        // Send a message back to Flutter that the alarm was acknowledged
        MainActivity.methodChannel?.invokeMethod("acknowledged", mapOf("notificationId" to channelId))
    }
}

class NotificationDeleteReceiver : BroadcastReceiver() {
    // Correct method signature with nullable parameters
    override fun onReceive(context: Context?, intent: Intent?) {
        Log.d("NotificationDelete", "Notification dismissed, stopping service")
        context?.stopService(Intent(context, AlarmService::class.java))
    }
}