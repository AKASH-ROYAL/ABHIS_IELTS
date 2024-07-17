// import 'dart:async';
// import 'dart:convert';
// import 'package:enarem/AppRouter/app_router.dart';
//
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'Firebase/firebase.dart';
// import 'Firebase/firebase_options.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// // function to listen to background changes
// Future _firebaseBackgroundMessage(RemoteMessage message) async {
//   print("Message data: ${message.data}");
//   if (message.notification != null) {
//     print("Some notification Received in background...");
//   }
// }
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   await FlutterDownloader.initialize(debug: false, ignoreSsl: true);
//   await AppRouter.initRouter();
// // initialize firebase messaging
//   await PushNotifications.init();
//   await PushNotifications.getDeviceToken();
//   if (!kIsWeb) {
//     await PushNotifications.localNotiInit();
//   }
// // Listen to background notifications
//   FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);
//
// // to handle foreground notifications
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
//     String payloadData = jsonEncode(message.data);
//     print("Got a message in foreground");
//     print("Message data: ${message.data}");
//     // await markNotificationAsRead(message.data['notification_id']);
//     if (message.notification != null) {
//       // Extract the image URL if it exists
//       String? imageUrl = message.notification!.android?.imageUrl ??
//           message.notification!.apple?.imageUrl;
//       PushNotifications.showSimpleNotification(
//           title: message.notification!.title!,
//           body: message.notification!.body!,
//           payload: payloadData,
//           imageUrl: imageUrl);
//     }
//   });
//
//   // on background notification tapped
//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     if (message.notification != null) {
//       handleNotificationTap(message);
//       print("Background Notification Tapped");
//     }
//   });
//
//   // for handling in terminated state
//   final RemoteMessage? message =
//   await FirebaseMessaging.instance.getInitialMessage();
//
//   if (message != null) {
//     print("Launched from terminated state");
//     print("Message data: ${message.data}");
//     Future.delayed(Duration(seconds: 1), () {
//       handleNotificationTap(message);
//     });
//   }
//
//   runApp((MyApp()));
// }
//
// void handleNotificationTap(RemoteMessage message) async {
//   var data = message.data;
//   print("Message data: ${message.data}");
//   await markNotificationAsRead(data['notification_id']);
//
//   // Build the route dynamically from the payload
//   String route = data['screen'];
//   if (route != null && route.isNotEmpty) {
//     // If there are IDs or specific parameters expected, append them to the route
//     if (data.containsKey('id')) {
//       route += '/${data['id']}';
//     }
//     // Navigate to the route
//     AppRouter.router.go(route);
//   } else {
//     print("No route specified in the payload");
//   }
// }
//
// Future<void> markNotificationAsRead(String? notificationId) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String accessToken = prefs.getString('authToken') ?? '';
//   if (notificationId == null) return;
//
//   final url = Uri.parse('https://enarem.com/api/notification-bar-mark-as-read');
//   final response = await http.post(url,
//       body: {'notification_id': notificationId},
//       headers: {'Authorization': 'Bearer $accessToken'});
//
//   if (response.statusCode == 200) {
//     print('Notification marked as read successfully.');
//   } else {
//     print('Failed to mark notification as read.');
//   }
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   void initState() {
//     temporaryToken();
//     super.initState();
//   }
//
//   Future<void> temporaryToken() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? existingToken = prefs.getString('temporaryToken');
//
//     // Check if token already exists
//     if (existingToken == null) {
//       final response =
//       await http.post(Uri.parse('https://enarem.com/api/temporary-token'));
//       Map<String, dynamic> data = jsonDecode(response.body);
//
//       if (data['status'] == 'success') {
//         print("API is integrated");
//         final String accessToken = data['temporary_token'];
//         await prefs.setString('temporaryToken', accessToken);
//       } else {
//         print("API is not integrated");
//       }
//     } else {
//       print("Token already exists, no need to integrate API again.");
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: AppRouter.router,
//       debugShowCheckedModeBanner: false,
//       title: 'Enarem',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
//             .copyWith(background: Colors.white),
//       ),
//     );
//   }
// }