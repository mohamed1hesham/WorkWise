import 'package:flutter/material.dart';
import 'package:flutter_application_1/tast/Login.dart';

final _fromkey = GlobalKey<FormState>();
class New extends StatefulWidget {
  const New ({super.key});

  @override
  State<New> createState() => _New();
}

class _New extends State<New> {
bool _secourText= true;
bool _sicourText= true;
final _NewPassword = TextEditingController();
final _ConfirmPassword = TextEditingController();


@override
  void dispose() {
    super.dispose();
    _NewPassword.dispose();
    _ConfirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
           decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/BK.jpg',),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child:Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 
                Image.asset('images/hard-work.png' , height: 150,),
            
               SizedBox(height: 50),
            
        
                   Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                    ),
        
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                         keyboardType: TextInputType.text,
                        controller: _NewPassword,
                        obscureText: _sicourText,
                        decoration: InputDecoration(
                           border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(20),
                      ),
                   
                      enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Color.fromARGB(255, 174, 137, 180)),
                        borderRadius: BorderRadius.circular(20),
                   
                      ),
                          
                          label: Text ("NewPassword" , style: TextStyle(color: Colors.black),),
                          suffixIcon: IconButton(onPressed: (){
                             
                             setState(() {
                              _sicourText =!_sicourText;
                             });
            
                          },
                          icon: Icon(_sicourText ? Icons.visibility_off :Icons.visibility,size: 22,)),
                          
                        ),
                      ),
                    ),
                  ),
                ),
                
                      
                      SizedBox(height: 7),
            
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                    ),
        
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                      keyboardType: TextInputType.text,
                        controller: _ConfirmPassword,
                        obscureText: _secourText,
                        decoration: InputDecoration(
                           border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(20),
                      ),
                   
                      enabledBorder: OutlineInputBorder(
                       borderSide: BorderSide(color: Color.fromARGB(255, 174, 137, 180)),
                        borderRadius: BorderRadius.circular(20),
                   
                      ),
                          
                          label: Text ("ConfirmPassword" , style: TextStyle(color: Colors.black),),
                          suffixIcon: IconButton(onPressed: (){
                             
                             setState(() {
                              _secourText =!_secourText;
                             });
            
                          },
                          icon: Icon(_secourText ? Icons.visibility_off :Icons.visibility,size: 22,)),
                          
                        ),
                      ),
                    ),
                  ),
                ),
        
                        
                        SizedBox(height: 50),
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
                                  MaterialPageRoute(builder:(context) => LoginScreen ()));
                        },
                        child: Text("Next"),
                        
        
                      ),
                     ),
                   ),
                 ),
        
                     SizedBox(height: 50),
              ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}