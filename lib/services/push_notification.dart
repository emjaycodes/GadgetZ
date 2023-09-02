// push notification
// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:oga_bassey/main.dart';

import '../screens/home/home_screen.dart';

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

    initPushNotifications();
}

void handleMessage(RemoteMessage? message) {
  print("Handling a background message: $message");
  //if message is null , do nothing
  if (message == null) return;

  navigatorKey.currentState?.pushNamed(
     HomeScreen.id,
     arguments: message
  );
}
Future initPushNotifications()async{
      // handle notification for the app is terminated 
      FirebaseMessaging.instance.getInitialMessage().then(handleMessage);


      // attach listeners
      FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    }

  // Future<void> sendOrderInRouteNotification(String userEmail, String location) async {
  //   // Construct the notification message
  //   try {
  //     final message = RemoteMessage(
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
  //   await _firebaseMessaging.sendMessage(message);
  //   } catch (e) {
  //      // Handle the exception (e.g., log it)
  //   print('Error sending push notification: $e');
  //   }
  
  // }

  }
