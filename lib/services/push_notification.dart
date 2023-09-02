// push notification
// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message)async{
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Paload: ${message.data}');
}

class FirebasePushNotification { 
  final _firebaseMessaging = FirebaseMessaging.instance;  

  Future<void>  initNotifications()async{
    await _firebaseMessaging.requestPermission();
    final FCMTtoken = await _firebaseMessaging.getToken();
    print('token: $FCMTtoken');
  
    // FirebaseMessaging.onBackgroundMessage((message) => handleBackgroundMessage(message));
}
  // Future<void> sendOrderInRouteNotification(String userEmail, String location) async {
  //   // Construct the notification message
  //   final message = RemoteMessage(
  //     data: {
  //       'title': 'Order in Route',
  //       'body': 'Your order is on its way to $location.',
  //     },
  //     notification: RemoteNotification(
  //       title: 'Order in Route',
  //       body: 'Your order is on its way to $location.',
  //     ),
  //   );

  //   // Send the message
  //   await _firebaseMessaging.sendMessage();
  // }

  }
