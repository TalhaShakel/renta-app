import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:renta/pages/login_page.dart';
import 'package:renta/pages/register_page.dart';
import 'package:renta/pages/showroom.dart';
import 'package:renta/provider/cars_data_provider.dart';
import 'package:renta/provider/login_button_provider.dart';
import 'package:renta/provider/register_button_provider.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
import 'pages/splash_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginButtonProvider>(
            create: (_) => LoginButtonProvider()),
        ChangeNotifierProvider<RegisterButtonProvider>(
            create: (_) => RegisterButtonProvider()),
        ChangeNotifierProvider(create: (_) => CarsDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Renta',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
        // Showroom
      ),
    );
  }
}
