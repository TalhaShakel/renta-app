// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:renta/pages/login_page.dart';
// import 'package:renta/pages/splash_page.dart';

// import 'package:renta/utils/color.dart';

// class wlecome extends StatefulWidget {
//   const wlecome({key}) : super(key: key);

//   @override
//   welcome2 createState() => welcome2();
// }

// class welcome2 extends State<wlecome> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Timer(const Duration(minutes: 1), () {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const SplashPage2()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [orangeColors, orangeLightColors],
//               end: Alignment.bottomCenter,
//               begin: Alignment.topCenter),
//         ),
//         child: Center(
//           child: Image.asset(
//             "assets/images/rentalogo.png",
//             height: 550,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/btn_widget.dart';
import 'login.dart';

class SplashPage2 extends StatefulWidget {
  const SplashPage2({key}) : super(key: key);

  @override
  _SplashPage2State createState() => _SplashPage2State();
}

class _SplashPage2State extends State<SplashPage2> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer(const Duration(minutes: 10), () {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const LoginPage()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         colors: [orangeColors, orangeLightColors],
            //         end: Alignment.bottomCenter,
            //         begin: Alignment.topCenter),
            //   ),
            //   child:
            SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/welcome.gif",
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * 0.8,
              ),
              ButtonWidget(
                btnText: "Get Started",
                onClick: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login()));
                },
              )
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => LoginPage()));
              //     },
              //     child: Text("data"))
            ],
          ),
        ));
    // );
  }
}
