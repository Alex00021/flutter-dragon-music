import 'dart:async';

import 'package:dragon_sound/root/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  runApp(const MyApp());

  ///设置状态栏背景色为透明色
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  SystemUiOverlayStyle systemUiOverlayStyle =
  const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

