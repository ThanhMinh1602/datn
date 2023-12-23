// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Notifications',
//       home: NotificationPage(),
//     );
//   }
// }

// class NotificationPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showNotification();
//           },
//           child: Text('Hiển thị thông báo'),
//         ),
//       ),
//     );
//   }

//   void showNotification() async {
//     AwesomeNotifications().initialize(
//       'resource://drawable/app_icon',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic tests',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );

//     AwesomeNotifications().createNotification(
//       content: NotificationContent(
//         id: 10,
//         channelKey: 'basic_channel',
//         title: 'Thông báo đầu tiên',
//         body: 'Đây là nội dung của thông báo đầu tiên.',
//       ),
//     );
//   }
// }
