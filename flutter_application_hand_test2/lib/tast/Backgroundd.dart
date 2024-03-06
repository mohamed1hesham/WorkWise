import 'package:flutter/material.dart';


void main() {

  runApp(back());
}

class back extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/hard-work.png'),),
          ),
          child: Center(
            child: Text("Welcome",style: TextStyle(
              color: const Color.fromARGB(255, 221, 83, 83),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              letterSpacing: 10,
            ),),
          ),
        ),
      )

   );
}
}