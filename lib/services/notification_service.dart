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
            soundSource: 'resource://raw/joyous_chime_notification',
            vibrationPattern: Int64List.fromList(
              [
                500,
                500,
                500,
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
          customSound: 'resource://raw/joyous_chime_notification',
          largeIcon: 'https://mindmycar.com/img/mind-my-car-logo.png',
          bigPicture: id == 1
              ? 'https://www.engineeringchoice.com/ezoimgfmt/i0.wp.com/www.engineeringchoice.com/wp-content/uploads/2023/04/Distance-Warning-light.webp?resize=1024%2C576&ssl=1&ezimgfmt=ng:webp/ngcb190'
              : id == 2
                  ? 'https://www.engineeringchoice.com/ezoimgfmt/i0.wp.com/www.engineeringchoice.com/wp-content/uploads/2023/08/Check-Engine-Light.webp?resize=1024%2C576&ssl=1&ezimgfmt=ng:webp/ngcb190'
                  : id == 3
                      ? 'https://www.engineeringchoice.com/ezoimgfmt/i0.wp.com/www.engineeringchoice.com/wp-content/uploads/2023/04/Engine-Temperature-Warning-Light.webp?resize=1024%2C576&ssl=1&ezimgfmt=ng:webp/ngcb190'
                      : id == 4
                          ? 'https://www.engineeringchoice.com/ezoimgfmt/i0.wp.com/www.engineeringchoice.com/wp-content/uploads/2023/04/Low-Fuel-Indicator-Light.webp?resize=1024%2C576&ssl=1&ezimgfmt=ng:webp/ngcb190'
                          : 'https://www.volvocars.com/images/support/img0e2b09346776ed66c0a8015206633715_1_--_--_VOICEpnghigh.png',
          notificationLayout: NotificationLayout.BigPicture),
    );
  }
}
