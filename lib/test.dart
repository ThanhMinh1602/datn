import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notifications'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await _showNotification();
          },
          child: const Text('Show Notification'),
        ),
      ),
    );
  }

  Future<void> _showNotification() async {
    // Khởi tạo cài đặt cho Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon'); // Đặt tên icon của ứng dụng
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    // Khởi tạo plugin
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    // Cấu hình kênh thông báo trên Android
    const AndroidNotificationChannel androidNotificationChannel =
        AndroidNotificationChannel(
      '123', // ID kênh
      'your channel name', // Tên kênh
      description: 'your channel description', // Mô tả kênh
      importance: Importance.max,
    );

    // Tạo kênh thông báo trên Android
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);

    // Xây dựng thông báo
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '123',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Hiển thị thông báo
    await flutterLocalNotificationsPlugin.show(
      0,
      'Title',
      'Body',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }
}
