
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:notifications/call.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String message = "This is a test message!";
  List<String> recipients = ["1234567890", "5556787676"];

  /// TODO SMS Function
  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container( 
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                      ElevatedButton(
                        onPressed: () async {
                              bool isallowed = await AwesomeNotifications().isNotificationAllowed();
                              if (!isallowed) {
                                //no permission of local notification
                                AwesomeNotifications().requestPermissionToSendNotifications();
                              }else{
                                  //show notification
                                  AwesomeNotifications().createNotification(
                                      content: NotificationContent( //simgple notification
                                          id: 123,
                                          channelKey: 'basic', //set configuration wuth key "basic"
                                          title: 'Welcome to FlutterCampus.com',
                                          body: 'This simple notification is from Flutter App',
                                          payload: {"name":"FlutterCampus"}
                                      )
                                  );
                             }
                        }, 
                        child: Text("Show Notification")
                      ),
      
                      ElevatedButton(
                        onPressed: () async {
                              bool isallowed = await AwesomeNotifications().isNotificationAllowed();
                              if (!isallowed) {
                                //no permission of local notification
                                AwesomeNotifications().requestPermissionToSendNotifications();
                              }else{
                                  //show notification
                                  AwesomeNotifications().createNotification(
                                      content: NotificationContent( //with asset image
                                          id: 1234,
                                          channelKey: 'image',
                                          title: 'Simple Notification With Image',
                                          body: 'This simple notification is from Flutter App',
                                          bigPicture: 'asset://assets/images/elephant.jpg',
                                          notificationLayout: NotificationLayout.BigPicture,
                                          fullScreenIntent: true, //it will display over app
                                          locked: true,
                                          payload: {"id":"1234"}
                                          
                                      )
                                  );
                             }
                        }, 
                        child: Text("Show Notification With Asset Image")
                      ),
      
                      ElevatedButton(
                        onPressed: () async {
                              bool isallowed = await AwesomeNotifications().isNotificationAllowed();
                              if (!isallowed) {
                                //no permission of local notification
                                AwesomeNotifications().requestPermissionToSendNotifications();
                              }else{
                                  //show notification
                                  AwesomeNotifications().createNotification(
                                      content: NotificationContent( //with image from URL
                                          id: 12345,
                                          channelKey: 'image',
                                          title: 'Simple Notification with Network Image',
                                          body: 'This simple notification is from Flutter App',
                                          bigPicture: 'https://www.fluttercampus.com/img/logo_small.webp',
                                          notificationLayout: NotificationLayout.BigPicture,
                                          payload: {"id":"12345"}
                                      )
                                  );
                             }
                        }, 
                        child: Text("Show Notification With Image From URL")
                      ),
      
                      ElevatedButton(
                        onPressed: (){
                            AwesomeNotifications().dismiss(123);
                        }, 
                        child: Text("Cancel Notification")
                      ),
      
                      ElevatedButton(
                        onPressed: (){
                              AwesomeNotifications().dismissAllNotifications();
                        }, 
                        child: Text("Cancel All Notifications")
                      ),
                
                  const SizedBox(
                    height: 70,
                  ),

                  Row(
                  // Number of columns in the grid
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // openCamera();
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => CallScreen()));
                      },
                      child: const Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.call_outlined,
                                size: 50,
                              ), // Replace 'icon_name_3' with the desired icon
                              SizedBox(height: 8),
                              Text(
                                'Call',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // _openGallery();
                        _sendSMS(message, recipients);
                      },
                      child: const Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.message_outlined,
                                size: 50,
                              ), // Replace 'icon_name_3' with the desired icon
                              SizedBox(height: 8),
                              Text(
                                'Message',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ],
              ),
          ),
      ),
    );
  }
}
