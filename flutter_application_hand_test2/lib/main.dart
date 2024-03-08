import 'package:flutter/material.dart';
import 'package:flutter_application_1/tast/user.dart';
import 'package:flutter_application_1/tast/Login.dart';
import 'package:flutter_application_1/tast/home.dart';
import 'package:flutter_application_1/tast/forgetPassword.dart';
import 'package:flutter_application_1/tast/sendcode.dart';
import 'package:flutter_application_1/tast/newPassword.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
      initialRoute: 'SigninScreen', 
      routes: {
        'Homescreen': (context) => const HomeScreen(),
        'forgetPassword': (context) =>  ForgetPassword(),
        'user': (context) =>  const user(),
        'sendcode': (context) => Send (),
        'newPassword': (context) =>  const New(),
      }
    );
  }
}
