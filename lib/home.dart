

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:notifications/call.dart';
import 'package:notifications/notifications.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String message = "This is a test message!";
  List<String> recipients = ["+255719401594", "+255693331836"];

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
                      child:  Card(
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
                      child: Card(
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

                const SizedBox(
                  height: 70,
                ),

              //second Row here ************************
              Row(
                // Number of columns in the grid
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      // openCamera();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationsScreen()));
                    },
                    child: Card(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_outlined,
                              size: 50,
                            ), // Replace 'icon_name_3' with the desired icon
                            SizedBox(height: 8),
                            Text(
                              'Notifications',
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
                      // _sendSMS(message, recipients);
                    },
                    child:Card(
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
