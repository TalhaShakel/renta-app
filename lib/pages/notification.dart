import 'package:flutter/material.dart';

import '../components/main_drawer.dart';

class Notifications extends StatelessWidget {
  const Notifications({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: const Color(0xFF1B6A65),
      ),
      drawer: const Main_Drawer(),
      body: Center(
        child: Text('About us'),
      ),
    );
  }
}
