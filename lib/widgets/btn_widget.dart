// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonWidget extends StatelessWidget {
  var btnText = "";
  // ignore: prefer_typing_uninitialized_variables
  var onClick;

  ButtonWidget({Key? key, required this.btnText, this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
        padding: const EdgeInsets.only(left: 20, right: 20),
        height: 54,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [(new Color(0xFF1B6A65)), new Color(0xFF1B6A65)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
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
        child: Text(
          btnText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
