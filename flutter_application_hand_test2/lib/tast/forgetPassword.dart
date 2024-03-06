import 'package:flutter/material.dart';
import 'package:flutter_application_1/tast/sendcode.dart';


void main() {
  runApp( ForgetPassword());
}
class ForgetPassword extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
    home: Scaffold(
     
          
      body:Container(
         child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/BK.jpg',),
              fit: BoxFit.cover,
    
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            SizedBox(height: 5),
            Image.asset('images/hard-work.png' , height: 150,),
            SizedBox(height: 90),
      
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                    keyboardType: TextInputType.number,
                    maxLength: (11),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(13),
                          ),
                           enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 174, 137, 180)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                      suffix: Icon(Icons.phone_android_rounded),
                      label: Text ("PhoneNumber" , style: TextStyle(color: Colors.black),)
                    ),
                  ),
            ),
          SizedBox(height: 70),
           Padding(
      
                   padding: const EdgeInsets.symmetric(horizontal: 3),
                   child: GestureDetector(
                     child: Container(
                       child: MaterialButton(
                        padding:const EdgeInsets.symmetric(vertical: 15),
                        minWidth: 150,
                        shape: const StadiumBorder(),
                      color: Colors.purple,
                        textColor: Colors.black,
                        onPressed: (){
      
                                  Navigator.of(context).push(
                                  MaterialPageRoute(builder:(context) => Send ()));
                        },
      
                        child: Text("Send"),
      
      
      
                 ),
               ),
             ),
            ),
          ],
        ),
      ),
      ),
   ));
  }
}