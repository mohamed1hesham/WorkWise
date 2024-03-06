import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  void openLoginScreen() {
    Navigator.of(context).pushReplacementNamed('LoginScreen');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 193, 10, 221),
          title: Text("Home"),
          ),
      backgroundColor: Color.fromARGB(255, 119, 212, 255),
    
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          padding: EdgeInsets.all(40),
          child: ListView(
            children: [
              const Row(
                children: [
                  CircleAvatar (
                    radius: 30,
                    backgroundImage: AssetImage('images/hard-work.png',),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text("HAND WORK", style: TextStyle(fontSize: 15),),

                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
  
              ListTile(
                title: Text("Account"),
                leading: Icon(Icons.person),
                onTap: () {

                },
              
              ),
              ListTile(
                title: Text("About"),
                leading: Icon(Icons.help),
                onTap: () {

                },
              ),
              ListTile(
                title: GestureDetector(
                  onTap: ()=>Navigator.of(context).pop(),
                  child: Text("Log out"),
                ),
                leading: Icon(Icons.logout),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
            IconButton(onPressed: (){

            }, icon: const Icon(Icons.search))
          ],
          
        ),
      ),
    );
  }
}