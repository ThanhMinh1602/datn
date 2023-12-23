import 'dart:typed_data';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static Future<void> requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();
    if (status.isGranted) {
      print('Notification permission granted');
    } else if (status.isDenied) {
      print('Notification permission denied');
    } else if (status.isPermanentlyDenied) {
      print('Notification permission permanently denied');
      // Đưa người dùng đến cài đặt để bật quyền thông báo (nếu cần)
      openAppSettings();
    }
  }

  static void showNotification(
      {int? id, String? channelKey, String? title, String? body}) async {
    AwesomeNotifications().initialize(
      'resource://drawable/app_icon',
      [
        NotificationChannel(
            channelKey: 'channel_1',
            channelName: 'Channel 1',
            channelDescription: 'Notification channel 1',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
            soundSource: 'resource://drawable/joyous_chime_notification',
            vibrationPattern: Int64List.fromList(
              [
                500,
                1000,
                500,
                2000,
                500,
                3000,
              ],
            )),
      ],
    );

    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: id ?? 0,
          channelKey: channelKey ?? '',
          title: title ?? '',
          body: body ?? '',
          customSound: 'resource://drawable/joyous_chime_notification'),
    );
  }
}
