//package com.example.create_order_app
//
//import android.app.Service
//import android.content.Intent
//import android.media.MediaPlayer
//import android.os.IBinder
//import androidx.core.app.NotificationCompat
//class AlarmService : Service() {
//    private var mediaPlayer: MediaPlayer? = null
//
//    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
//        startForeground(2023, createNotification())
//        mediaPlayer = MediaPlayer.create(this, R.raw.alarm_sound).apply {
//            isLooping = true
//            start()
//        }
//        return START_STICKY
//    }
//
//    private fun createNotification() = NotificationCompat.Builder(this, "ALARM_CHANNEL")
//        .setContentTitle("Order Alert Active")
//        .setContentText("New order requires acknowledgment")
//        .setSmallIcon(R.drawable.ic_alarm)
//        .build()
//
//    override fun onDestroy() {
//        mediaPlayer?.run {
//            if (isPlaying) stop()
//            release()
//        }
//        super.onDestroy()
//    }
//
//    override fun onBind(intent: Intent?): IBinder? = null
//}