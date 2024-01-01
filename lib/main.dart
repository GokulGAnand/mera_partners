import 'package:flutter/material.dart';
import 'package:sample2_clone/ui/users/views/createscreen.dart';
import 'package:sample2_clone/ui/users/views/loginscreen.dart';
import 'package:sample2_clone/ui/users/views/profilescreen.dart';
import 'package:sample2_clone/ui/users/views/s1.dart';
import 'package:sample2_clone/ui/users/views/s2.dart';
import 'package:sample2_clone/ui/users/views/s3.dart';
import 'package:sample2_clone/ui/users/views/s4.dart';
import 'package:sample2_clone/ui/users/views/thirdscreen.dart';
import 'package:sample2_clone/ui/users/views/verificationscreen.dart';
import 'package:sample2_clone/ui/users/views/welcomescreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home:   verification(),
    );
  }
}
