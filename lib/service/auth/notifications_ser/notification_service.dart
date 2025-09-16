import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_employee/firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  @pragma('vm:entry-point')
  static Future<void> firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Handling a background message: ${message.messageId}');

    await initializeLocalNotification();
    await showNotification(message);
  }

  static Future<void> initializeNotification() async {
    await _firebaseMessaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      await showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print("app opened from bckground notification ${message.data}");
    });

    await _getFcmToken();

    await initializeLocalNotification();

    await _getInitialNotification();
    
  }
  static Future<void> _getFcmToken() async {
    String? token = await _firebaseMessaging.getToken();
    print('fcm token $token');
  }


  static Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    Map<String, dynamic> data = message.data;

    String? title = notification?.title ?? data['title'] ?? 'No Title';
    String? body = notification?.body ?? data['body'] ?? 'No Body';

    AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'your_channel_id', // channel ID
      'your_channel_name', // channel name
      channelDescription: 'your_channel_description', // channel description
      importance: Importance.high,
      priority: Priority.high,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }

  static Future<void> initializeLocalNotification() async {
    const AndroidInitializationSettings andoidinit =
        AndroidInitializationSettings('@drawable/ic_launcher');

    final InitializationSettings initSettings = InitializationSettings(
      android: andoidinit,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print('user tapped notif : ${response.payload}');
      },
    );
  }

  static Future<void> _getInitialNotification() async {
    RemoteMessage? message = await FirebaseMessaging.instance
        .getInitialMessage();

    if (message != null) {
      print('app is terminated ${message.data}');
    }
  }
}
