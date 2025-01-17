import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatefulWidget {
  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController phoneCallController = new TextEditingController();

  /// TODO Direct Phone Call Function
  void makeDirectCall(String phone) async {
    await FlutterPhoneDirectCaller.callNumber(phone);
  }

  /// TODO Indirect Phone Call Function
  void launchCall(String phone) async {
    String url = "tel:" + phone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print(' Could not launch $url');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone), labelText: "Phone Number"),
                  controller: phoneCallController,
                  validator: (val) {
                    return RegExp(
                      // "^(?:[+0]9)?[0-9]{10,12}",
                      "^[0-9]{4}[0-9]{6}",
                    ).hasMatch(val!)
                        ? null
                        : 'Format XXXX XXXXXX';
                  },
                ),
              ),
            ),
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// TODO Direct Call
                // ignore: deprecated_member_use
                ElevatedButton.icon(
                  onPressed: () => _formKey.currentState!.validate()
                      ? makeDirectCall(phoneCallController.text)
                      : print("Valid Phone No Required!"),
                  
                  icon: Icon(Icons.phone, color: Colors.white, size: 20.0),
                  label: Text(
                    "Direct Call",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  
                ),

                /// TODO Indirect Call
                // ignore: deprecated_member_use
                ElevatedButton.icon(
                  onPressed: () => _formKey.currentState!.validate()
                      ? launchCall(phoneCallController.text)
                      : print("Valid Phone No Required!"),
                  
                  icon: Icon(Icons.phone_android,
                      color: Colors.white, size: 20.0),
                  label: Text(
                    "Indirect Call",
                    style: TextStyle(color: Colors.white, fontSize: 17.0),
                  ),
                  
                ),
              ],
            )
          ],
        ),
    );
  }
}
