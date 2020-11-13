import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yellowclass/Screens/HomeScreen.dart';
import 'package:yellowclass/Screens/VideoPlayer.dart';

import 'Screens/Logo.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouPlayer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Logo(),
    );
  }
}

