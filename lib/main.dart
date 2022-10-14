import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hangman/presentation/screens/game_screen.dart';
import 'package:sizer/sizer.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder :(context, orientation , deviceType ) {
        return MaterialApp(
        title: 'Hang Man',
        theme: ThemeData(
    primarySwatch: Colors.blue,
    ),    
    home: const GameScreen(),
    );
    }
    );
  }
}

