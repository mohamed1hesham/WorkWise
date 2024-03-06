import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/tast/Login.dart';
import 'package:flutter_application_1/model/server_worker.dart'; 

class Worker extends StatefulWidget {
  const Worker({Key? key}) : super(key: key);

  @override
  State<Worker> createState() => _WorkerState();
}

class _WorkerState extends State<Worker> {
  bool _secureText = true;
  bool _sicourText = true;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _nationalIdController = TextEditingController(); // حقل الـ National ID
  final _jobController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _createUserTable();
  }

  void _createUserTable() {
    http.post(Uri.parse(ServerWorkerAPI.API_URL), body: {'action': 'CREATE_TABLE_LOGIN'})
        .then((response) {
      if (response.statusCode == 200) {
        print('User table created successfully');
      } else {
        print('Failed to create user table: ${response.reasonPhrase}');
      }
    }).catchError((error) {
      print('Error creating user table: $error');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _countryController.dispose();
    _cityController.dispose();
    _idNumberController.dispose();
    _nationalIdController.dispose(); // تحرير المورد عند الإنتهاء
    _jobController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void _insertWorker() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String country = _countryController.text;
    String city = _cityController.text;
    String idNumber = _idNumberController.text;
    String nationalId = _nationalIdController.text; // استخدام القيمة الجديدة
    String job = _jobController.text;
    String password = _passwordController.text;

    ServerWorkerAPI.insertWorker(firstName, lastName, country, city, idNumber, nationalId, job, password)
        .then((result) {
      if (result == 'Worker inserted successfully') {
        print('Worker inserted successfully');
      } else {
        print('Failed to insert worker: $result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/BK.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "First Name",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Last Name",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _countryController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Country",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(Icons.home_filled),
                      labelText: "City",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _idNumberController,
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(Icons.phone_android_rounded),
                      labelText: "PhoneNumber",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _nationalIdController,
                    keyboardType: TextInputType.number,
                    maxLength: 14,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: Icon(Icons.credit_card),
                      labelText: "National ID",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _jobController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Jop",
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: _secureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _secureText = !_secureText;
                          });
                        },
                        icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility, size: 22),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.text,
                    obscureText: _sicourText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Confirm Password",
                      labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _sicourText = !_sicourText;
                          });
                        },
                        icon: Icon(_sicourText ? Icons.visibility_off : Icons.visibility, size: 22),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: GestureDetector(
                    onTap: () {
                      _insertWorker(); 
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        minWidth: 150,
                        shape: const StadiumBorder(),
                        color: Colors.purple,
                        textColor: Colors.black,
                        onPressed: () {
                          _insertWorker();
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Text("Sign in"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
