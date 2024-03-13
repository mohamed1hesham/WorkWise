import 'package:flutter/material.dart';
import 'package:flutter_application_1/tast/home_worker.dart';
import 'package:flutter_application_1/tast/user.dart';
import 'package:flutter_application_1/tast/Login.dart';
import 'package:flutter_application_1/tast/forgetPassword.dart';
// import 'package:flutter_application_1/tast/newPassword.dart';
import 'package:flutter_application_1/tast/Home_user.dart';

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
      initialRoute: 'LoginScreen',
      routes: {
        'forgetPassword': (context) => ForgetPassword(),
        'user': (context) => const user(),
        // 'newPassword': (context) => const New(),
        'home_user': (context) => const SearchPage(),
        'home_worker': (context) =>  WorkerPage(), // إضافة WorkerPage هنا
        'SearchPage': (context) => const SearchPage(),
        'LoginScreen': (context) => const LoginScreen(),
      }
    );
  }
}
