//package com.example.create_order_app
//
//import android.content.BroadcastReceiver
//import android.content.Context
//import android.content.Intent
//import android.widget.Toast
//import android.app.NotificationManager
//import android.media.MediaPlayer  // Add this import
//
//class AlarmActionReceiver : BroadcastReceiver() {
//    override fun onReceive(context: Context, intent: Intent) {
//        if (intent.action == "ACKNOWLEDGE_ALARM") {
//            // Cancel notification
//            (context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager)
//                .cancel(2023)  // Use the same NOTIFICATION_ID as in MainActivity
//
//            // Stop media player through MainActivity
//            MainActivity.stopAlarm(context)
//
//            // Show confirmation
//            Toast.makeText(context, "Order Acknowledged!", Toast.LENGTH_SHORT).show()
//        }
//    }
//}