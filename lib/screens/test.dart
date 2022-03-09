import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class mylog extends StatelessWidget {
  TextEditingController pka1 = TextEditingController();
  TextEditingController pka = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: pka1),
            TextField(
              controller: pka,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: pka.text, password: pka1.text);
                      
                },
                child: Text("data"))
          ],
        ),
      ),
    );
  }
}
