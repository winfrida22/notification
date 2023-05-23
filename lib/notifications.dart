import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            
            children: [
        
                  SizedBox(height: 100,),
        
                  Container(
                    height:250 ,
                    width: double.infinity,
                    decoration:BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/notification.jpg"))
                    ),
        
                  ),
        
              Container(
                height:250,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                  
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                              
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height:50,
                          // alignment: Alignment.centerRight,
                          child: ElevatedButton(
                              onPressed: () async {
                                bool isallowed =
                                    await AwesomeNotifications().isNotificationAllowed();
                                if (!isallowed) {
                                  //no permission of local notification
                                  AwesomeNotifications()
                                      .requestPermissionToSendNotifications();
                                } else {
                                  //show notification
                                  AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                          //simgple notification
                                          id: 123,
                                          channelKey:
                                              'basic', //set configuration wuth key "basic"
                                          title: 'Welcome to FlutterCampus.com',
                                          body: 'This simple notification is from Flutter App',
                                          payload: {"name": "FlutterCampus"}));
                                }
                              },
                              child: Text("Notification On")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height:50,
                          // alignment
                          child: ElevatedButton(
                              onPressed: () async {
                                bool isallowed =
                                    await AwesomeNotifications().isNotificationAllowed();
                                if (!isallowed) {
                                  //no permission of local notification
                                  AwesomeNotifications()
                                      .requestPermissionToSendNotifications();
                                } else {
                                  //show notification
                                  AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                          //with asset image
                                          id: 1234,
                                          channelKey: 'image',
                                          title: 'Simple Notification With Image',
                                          body:
                                              'This simple notification is from Flutter App',
                                          bigPicture: 'asset://assets/images/elephant.jpg',
                                          notificationLayout: NotificationLayout.BigPicture,
                                          fullScreenIntent: true, //it will display over app
                                          locked: true,
                                          payload: {"id": "1234"}));
                                }
                              },
                              child: Text("Display Notification")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height:50,
                          // alignment
                          child: ElevatedButton(
                              onPressed: () async {
                                bool isallowed =
                                    await AwesomeNotifications().isNotificationAllowed();
                                if (!isallowed) {
                                  //no permission of local notification
                                  AwesomeNotifications()
                                      .requestPermissionToSendNotifications();
                                } else {
                                  //show notification
                                  AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                          //with image from URL
                                          id: 12345,
                                          channelKey: 'image',
                                          title: 'Simple Notification with Network Image',
                                          body:
                                              'This simple notification is from Flutter App',
                                          bigPicture: 'https://www.fluttercampus.com/img/logo_small.webp',
                                          notificationLayout: NotificationLayout.BigPicture,
                                          payload: {"id": "12345"}));
                                }
                              },
                              child: Text("Url Notifications")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height:50,
                          // alignment
                          child: ElevatedButton(
                              onPressed: () {
                                AwesomeNotifications().dismiss(123);
                              },
                              child: Text("Clear Notification")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height:50,
                          // alignment
                          child: ElevatedButton(
                              onPressed: () {
                                AwesomeNotifications().dismissAllNotifications();
                              },
                              child: Text("Clear all Notifications")),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
