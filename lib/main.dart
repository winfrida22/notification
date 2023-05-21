import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notifications/home.dart';



 void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   AwesomeNotifications().initialize(
     null, 
     [            // notification icon 
        NotificationChannel(
            channelGroupKey: 'basic_test',
            channelKey: 'basic',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            channelShowBadge: true,
            importance: NotificationImportance.High,
            enableVibration: true,
        ),

        NotificationChannel(
            channelGroupKey: 'image_test',
            channelKey: 'image',
            channelName: 'image notifications',
            channelDescription: 'Notification channel for image tests',
            defaultColor: Colors.redAccent,
            ledColor: Colors.white,
            channelShowBadge: true,
            importance: NotificationImportance.High
        )

        //add more notification type with different configuration

     ]
  );

  //tap listiner on notification
  // AwesomeNotifications().actionStream.listen((ReceivedNotification receivedNotification){
  //    print(receivedNotification.payload!['name']);
  //    //output from first notification:  FlutterCampus
  // });

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

