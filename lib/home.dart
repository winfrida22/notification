import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:notifications/call.dart';
import 'package:notifications/notifications.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  with SingleTickerProviderStateMixin{
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

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 10),
    )..repeat(reverse: true);
    // _animation =
    //     Tween<double>(begin: 0.0, end: 100.0).animate(_animationController);
    _animation = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0, end: -10),
        weight: 0.5,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: -10, end: 10),
        weight: 1.0,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 10, end: 0),
        weight: 0.5,
      ),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                // AnimatedContainer(
                //   duration: const Duration(milliseconds: 500),
                //   transform: Matrix4.translationValues(0, _animation.value, 0),
                //   child: Image.asset(
                //     "assets/icons/bell.png",
                //     height: 100,
                //     width: 100,
                //   ),
                // ),
                 AnimatedBuilder(
                  animation: _animationController,
                  builder: (BuildContext context, Widget? child) {
                    return Transform.translate(
                      offset: Offset( _animation.value,0),
                      child: Image.asset(
                        "assets/icons/bell.png",
                        height: 100,
                        width: 100,
                      ),
                    );
                  },
                ),
                // Container(
                //   height: 200,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage("assets/images/home.jpg"),
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 50,
                ),
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
                                builder: (context) => CallScreen()));
                      },
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/call.png"),
                              // Icon(
                              //   Icons.call_outlined,
                              //   size: 50,
                              // ), // Replace 'icon_name_3' with the desired icon
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
                              Image.asset("assets/icons/notification.png"),

                              // Icon(
                              //   Icons.message_outlined,
                              //   size: 50,
                              // ), // Replace 'icon_name_3' with the desired icon
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
                              Image.asset("assets/icons/bell.png"),

                              // Icon(
                              //   Icons.notifications_outlined,
                              //   size: 50,
                              // ), // Replace 'icon_name_3' with the desired icon
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
                    // InkWell(
                    //   onTap: () {
                    //     // _openGallery();
                    //     // _sendSMS(message, recipients);
                    //   },
                    //   child:Card(
                    //     child: Padding(
                    //       padding: EdgeInsets.symmetric(
                    //           horizontal: 20.0, vertical: 20),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Icon(
                    //             Icons.message_outlined,
                    //             size: 50,
                    //           ), // Replace 'icon_name_3' with the desired icon
                    //           SizedBox(height: 8),
                    //           Text(
                    //             'Message',
                    //             textAlign: TextAlign.center,
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
