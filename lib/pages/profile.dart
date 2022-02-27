import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

class Profile extends StatelessWidget {
  const Profile({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: const Color(0xFF1B6A65),
       ),
      drawer: Main_Drawer(),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
