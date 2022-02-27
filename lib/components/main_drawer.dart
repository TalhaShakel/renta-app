import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:renta/models/login_response_model.dart';
import 'package:renta/pages/aboutus.dart';
import 'package:renta/pages/login_page.dart';
import 'package:renta/pages/notification.dart';
import 'package:renta/pages/orders.dart';
import 'package:renta/pages/profile.dart';
import 'package:renta/pages/showroom.dart';
import 'package:renta/services/shared_service.dart';

class Main_Drawer extends StatefulWidget {
  const Main_Drawer({key}) : super(key: key);

  @override
  State<Main_Drawer> createState() => _Main_DrawerState();
}

class _Main_DrawerState extends State<Main_Drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Color(0xFF1B6A65),
            child: Center(
              child: FutureBuilder(
                  future: SharedService.loginDetails(),
                  builder:
                      (context, AsyncSnapshot<LoginResponseModel?> snapshot) {
                    print('f:' + snapshot.data.toString());
                    return !snapshot.hasData
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Column(
                            children: <Widget>[
                              Container(
                                width: 100,
                                height: 100,
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                // ignore: prefer_const_constructors
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${snapshot.data!.data.fullName}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text(
                                '${snapshot.data!.data.email}',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                            ],
                          );
                  }),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Home',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Showroom(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.car_rental),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Orders',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Orders(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Notifications',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Notifications(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'About us',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Aboutus(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Profile',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 0,
            indent: 20,
            endIndent: 0,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.lock_open),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Logout',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        await SharedService.logout(context);
                      },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
