import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'splash_page.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class register extends StatefulWidget {
  // const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

final _formKey = GlobalKey<FormState>();
TextEditingController email = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController fullnamecontroller = TextEditingController();
TextEditingController usernamecontroller = TextEditingController();
TextEditingController phoneNumbercontroller = TextEditingController();
// Future userregister() async {
//   try {
//     String url = "https://rentacar1311.azurewebsites.net/api/v1/signup";
//     var response = await http.post(Uri.parse(url), body: {
//       "fullname": name.text,
//       "username": name.text,
//       "phoneNumber": phoneNumbercontroller.text,
//       "email": email.text,
//       "password": password.text,
//       "confirmPassword": password.text,
//       "role": "Buyer",
//     });
//     print("response status :" + response.statusCode.toString());
//     print("response body :" + response.body.toString());

//     var data = json.decode(response.body);
//     print("okkkkk" + data);
//     // if (data == "Error") {
//     //   Fluttertoast.showToast(
//     //       msg: "User Already Exist",
//     //       toastLength: Toast.LENGTH_SHORT,
//     //       gravity: ToastGravity.CENTER,
//     //       timeInSecForIosWeb: 1,
//     //       backgroundColor: Colors.red,
//     //       textColor: Colors.white,
//     //       fontSize: 16.0);
//     // } else {
//     //   Fluttertoast.showToast(
//     //       msg: "Successfull",
//     //       toastLength: Toast.LENGTH_SHORT,
//     //       gravity: ToastGravity.CENTER,
//     //       timeInSecForIosWeb: 1,
//     //       backgroundColor: Colors.red,
//     //       textColor: Colors.white,
//     //       fontSize: 16.0);
//     // }
//   } catch (e) {
//     print(e.toString());
//   }
// }
registerfirebase() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text);
    Fluttertoast.showToast(
        msg: "Register Successfull",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
  } catch (e) {
    Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    email.clear();
    password.clear();
    phoneNumbercontroller.clear();
    name.clear();
  }
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeColors,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [orangeColors, orangeLightColors],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter),
              // ignore: prefer_const_constructors
              // image: DecorationImage(
              //   image: AssetImage("assets/images/back.jpeg"),
              //   fit: BoxFit.contain,
              // ),
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 50,
          right: 50,
          child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              width: 420,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [orangeColors, orangeLightColors],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
                borderRadius: BorderRadius.circular(25),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 25.0,
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Image.asset("assets/images/rentalogo.png",
                          height: 130, width: 250),
                      // Container(
                      //     height: 25,
                      //     width: 300,
                      //     decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //           colors: [orangeColors, orangeLightColors],
                      //           end: Alignment.bottomCenter,
                      //           begin: Alignment.topCenter),
                      //     ),
                      //     // color:  [orangeColors, orangeLightColors],
                      //     child:
                      //      Padding(
                      //       padding: const EdgeInsets.only(left: 30),
                      //       child: Text(
                      //         "Please Login To Your Account",
                      //         style: TextStyle(
                      //             fontSize: 18,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.white),
                      //       ),
                      //     )
                      //     ),
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: 'User Name',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          controller: name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Full Name is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: 'user123@gmail.com',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          controller: email,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Full Name is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8, left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: '31XXXXXXX',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          controller: phoneNumbercontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Full Name is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4, left: 10, right: 10),
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: password,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: '****',
                            hintStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   height: 40,
                      //   width: 400,
                      //   color: Colors.white,
                      //   child: Row(
                      //     // ignore: prefer_const_literals_to_create_immutables
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 2),
                      //         child: Text(
                      //           "Cbx",
                      //           style: TextStyle(
                      //             color: Colors.green[800],
                      //             fontSize: 14,
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 8),
                      //         child: Text(
                      //           "Rmemember me?",
                      //           style: TextStyle(
                      //             color: Colors.green[800],
                      //             fontWeight: FontWeight.bold,
                      //             fontSize: 14,
                      //           ),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding: const EdgeInsets.only(left: 70),
                      //         child: Text(
                      //           "Forgot Password?",
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.green[800],
                      //             fontSize: 14,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0, bottom: 8),
                        child: Container(
                          height: 30,
                          width: 200,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [orangeColors, orangeLightColors],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter)),
                          child: ElevatedButton(
                            onPressed: () async {
                              registerfirebase();
                              // _formKey.currentState?.validate();
                              // try {
                              //   await FirebaseAuth.instance
                              //       .createUserWithEmailAndPassword(
                              //           email: "emailtext@gmail.com",
                              //           password: " password.text");
                              //   print("user is register");
                              // } catch (e) {}
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[600]),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(25),
                              // ),
                              // shape: RoundedRectangleBorder(
                              //   borderRadius:
                              //       BorderRadius.circular(12), // <-- Radius
                              // ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => register()));
                      //     },
                      // child: Container(
                      //   height: 20,
                      //   width: 400,
                      //   decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //           colors: [orangeColors, orangeLightColors],
                      //           end: Alignment.bottomCenter,
                      //           begin: Alignment.topCenter)),
                      //   child: Center(
                      //     child: Row(
                      //       // ignore: prefer_const_literals_to_create_immutables
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.only(left: 1),
                      //           child: Text(
                      //             "Do not have Account?",
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 14,
                      //             ),
                      //           ),
                      //         ),
                      //         Spacer(),
                      //         Padding(
                      //           padding: const EdgeInsets.only(left: 6),
                      //           child: Text(
                      //             "Signup",
                      //             style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 14,
                      //               fontWeight: FontWeight.bold,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              )),
        ),
      ]),
    );
  }
}
