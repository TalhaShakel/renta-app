import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:renta/models/login_request_model.dart';
import 'package:renta/pages/forget_password.dart';
import 'package:renta/pages/register_page.dart';
import 'package:renta/pages/showroom.dart';
import 'package:renta/provider/login_button_provider.dart';
import 'package:renta/services/api_service.dart';
import 'package:renta/utils/constant.dart';

import '../keyboard.dart';
import '../services/authservice.dart';
import '../widgets/btn_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  var email = '';
  var password = '';
  bool? remember = false;
  final List<String?> errors = [];

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var token;

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

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.only(bottomLeft: const Radius.circular(90)),
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
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          )),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
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
                        offset: const Offset(0, 10),
                        blurRadius: 50,
                        color: const Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (newValue) => email = newValue ?? '',
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kEmailNullError);
                    } else if (emailValidatorRegExp.hasMatch(value)) {
                      removeError(error: kInvalidEmailError);
                    }
                    // ignore: avoid_returning_null_for_void
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      // addError(error: kEmailNullError);
                      return kEmailNullError;
                    } else if (!emailValidatorRegExp.hasMatch(value)) {
                      // addError(error: kInvalidEmailError);
                      return kInvalidEmailError;
                    }
                    // return null;
                  },
                  cursorColor: const Color(0xFF1B6A65),
                  // ignore: unnecessary_const
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: const Color(0xFF1B6A65),
                    ),
                    hintText: "Enter Email",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
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
                  controller: passwordController,
                  obscureText: true,
                  onSaved: (newValue) => password = newValue ?? '',
                  onChanged: (val) {
                    password = val;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      // addError(error: kPassNullError);
                      return kPassNullError;
                    } else if (value.length < 8) {
                      // addError(error: kShortPassError);
                      return kShortPassError;
                    }
                    // return null;
                  },
                  cursorColor: const Color(0xFF1B6A65),
                  // ignore: unnecessary_const
                  decoration: const InputDecoration(
                    focusColor: Color(0xFF1B6A65),
                    // ignore: unnecessary_const
                    icon: const Icon(
                      Icons.vpn_key,
                      color: Color(0xFF1B6A65),
                    ),
                    hintText: "Enter Password",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              // Write Click Listener Code Here
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotPassword(),
                  ),
                );
              }
            },
            child: const Text("Forget Password?"),
          ),
        ),
        Center(
          child: Provider.of<LoginButtonProvider>(context).isLoading
              ? CircularProgressIndicator(
                  color: Color(0xFF1B6A65),
                )
              : ButtonWidget(
                  onClick: () async {
                    if (_formKey.currentState!.validate()) {
                      // _formKey.currentState.save();
                      if (!isValidEmail(emailController.text)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Invalid Email"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      var loginRequestModel = LoginRequestModel(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      Provider.of<LoginButtonProvider>(context, listen: false)
                          .setLoading(true);
                      var res = await APIService.login(loginRequestModel);
                      if (res == true) {
                        Provider.of<LoginButtonProvider>(context, listen: false)
                            .setLoading(false);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Showroom()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('$res'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      }
                      Provider.of<LoginButtonProvider>(context, listen: false)
                          .setLoading(false);
                      // signIn(email, password);
                    }
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Showroom()));
                  },
                  btnText: "LOGIN",
                ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't Have Any Account?"),
              GestureDetector(
                child: const Text(
                  "Register Now",
                  style: TextStyle(color: const Color(0xFF1B6A65)),
                ),
                onTap: () {
                  // Write Tap Code Here.
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegPage(),
                      ));
                },
              )
            ],
          ),
        )
      ],
    )));
  }

  isValidEmail(email) {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }
}
