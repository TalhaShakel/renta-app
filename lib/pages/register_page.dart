// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:renta/models/register_response_model.dart';
import 'package:renta/pages/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:renta/provider/register_button_provider.dart';
import 'package:renta/services/api_service.dart';
import 'package:renta/utils/constant.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import '../models/register_request_model.dart';
import '../widgets/btn_widget.dart';

class RegPage extends StatefulWidget {
  const RegPage({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<RegPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController repasswordcontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController phoneNumbercontroller = TextEditingController();

  bool isApiCallProcess = false;
  bool hidePassword = true;
  static final GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  // FirebaseAuth auth = FirebaseAuth.instance;
  // firebase_reg() async {
  //   UserCredential userCredential = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(
  //           email: emailcontroller.text, password: passwordcontroller.text);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: globalFormKey,
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(90)),
              color: new Color(0xFF1B6A65),
              gradient: LinearGradient(
                colors: [(new Color(0xFF1B6A65)), new Color(0xFF1B6A65)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "assets/images/rentalogo.png",
                    height: 50,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, top: 20),
                  alignment: Alignment.bottomRight,
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                )
              ],
            )),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              controller: fullnamecontroller,
              cursorColor: const Color(0xFF1B6A65),
              // ignore: unnecessary_const
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: Color(0xFF1B6A65),
                ),
                hintText: "Full Name",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Full Name is required";
                }
                return null;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              controller: usernamecontroller,
              cursorColor: Color(0xFF1B6A65),
              // ignore: unnecessary_const
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.verified_user_sharp,
                  color: Color(0xFF1B6A65),
                ),
                hintText: "username",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Username is required";
                }
                return null;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffEEEEEE),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: phoneNumbercontroller,
              cursorColor: Color(0xFF1B6A65),
              decoration: InputDecoration(
                focusColor: Color(0xFF1B6A65),
                icon: Icon(
                  Icons.phone,
                  color: Color(0xFF1B6A65),
                ),
                hintText: "Phone Number",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Number is required";
                }
                return null;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffEEEEEE),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Color(0xFF1B6A65),
              decoration: InputDecoration(
                focusColor: Color(0xFF1B6A65),
                icon: Icon(
                  Icons.email,
                  color: Color(0xFF1B6A65),
                ),
                hintText: "Email",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email is required";
                }
                if (!emailValidatorRegExp.hasMatch(value)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffEEEEEE),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              onChanged: (value) {},
              cursorColor: Color(0xFF1B6A65),
              // ignore: unnecessary_const
              decoration: const InputDecoration(
                focusColor: Color(0xFF1B6A65),
                icon: Icon(
                  Icons.vpn_key,
                  color: Color(0xFF1B6A65),
                ),
                hintText: "Enter Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: const Color(0xffEEEEEE),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 20),
                    blurRadius: 100,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: TextFormField(
              controller: repasswordcontroller,
              obscureText: true,
              onChanged: (value) {},
              cursorColor: Color(0xFF1B6A65),
              // ignore: unnecessary_const
              decoration: const InputDecoration(
                focusColor: Color(0xFF1B6A65),
                // ignore: unnecessary_const
                icon: const Icon(
                  Icons.vpn_key,
                  color: Color(0xFF1B6A65),
                ),
                hintText: "Re-type Password",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter password again!";
                }
                if (passwordcontroller.text != value) {
                  return "Password does not match!";
                }
                return null;
              },
            ),
          ),
          Center(
            child: Provider.of<RegisterButtonProvider>(context).isLoading
                ? CircularProgressIndicator(
                    color: Color(0xFF1B6A65),
                  )
                : ButtonWidget(
                    onClick: () async {
                      if (globalFormKey.currentState!.validate()) {
                        // _formKey.currentState.save();
                        if (!isValidEmail(emailcontroller.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Invalid Email"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        } else if (passwordcontroller.text !=
                            repasswordcontroller.text) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Password does not match"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }
                        var registerModel = RegisterRequestModel(
                          email: emailcontroller.text,
                          password: passwordcontroller.text,
                          phonenumber: phoneNumbercontroller.text,
                          fullname: fullnamecontroller.text,
                          username: usernamecontroller.text,
                          confirmPassword: repasswordcontroller.text,
                        );

                        Provider.of<RegisterButtonProvider>(context,
                                listen: false)
                            .setLoading(true);
                        var res = await APIService.register(registerModel);
                        if (res is RegisterResponseModel) {
                          Provider.of<RegisterButtonProvider>(context,
                                  listen: false)
                              .setLoading(false);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Registered Successfully"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$res'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                        Provider.of<RegisterButtonProvider>(context,
                                listen: false)
                            .setLoading(false);
                        // signIn(email, password);
                      }
                      //Navigator.push(context,
                      //MaterialPageRoute(builder: (context) => Showroom()));
                    },
                    btnText: "Register",
                  ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have Already Member?  "),
                GestureDetector(
                  child: const Text(
                    "Login Now",
                    style: TextStyle(color: Color(0xFF1B6A65)),
                  ),
                  onTap: () {
                    // Write Tap Code Here.
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                )
              ],
            ),
          )
        ],
      ),
    )));
  }

  bool isValidEmail(text) {
    return emailValidatorRegExp.hasMatch(text);
  }
}
