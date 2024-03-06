import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/server_user.dart';
import 'package:http/http.dart' as http;

class user extends StatefulWidget {
  const user({Key? key}) : super(key: key);
  @override
  State<user> createState() => _userState();
}
class _userState extends State<user> {
  bool _secureText = true;
  bool _secureTextConfirm = true;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _countryController = TextEditingController();
  final _cityController = TextEditingController();
  final _idNumberController = TextEditingController();
  final _nationalIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _userType = 'User'; // Default to 'User'
  final _jobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _createUserTable();
  }

  void _createUserTable() {
    http.post(Uri.parse(ServerUserAPI.API_URL), body: {'action': 'CREATE_TABLE_LOGIN'})
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

void _insertUser() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String country = _countryController.text;
    String city = _cityController.text;
    String idNumber = _idNumberController.text;
    String nationalId = _nationalIdController.text;
    String password = _passwordController.text;
    String userType = _userType; // قيمة نوع المستخدم
    String job = _jobController.text;

    ServerUserAPI.insertUser(firstName, lastName, country, city, idNumber, nationalId, password, userType, job) // تم تعديل دالة الإدراج لتأخذ المعامل الجديد
        .then((result) {
      if (result == 'User inserted successfully') {
        print('User inserted successfully');
        // Navigate to success screen or perform other actions
      } else {
        print('Failed to insert user: $result');
        // Handle error, e.g., display an error message to the user
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "First Name",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Last Name",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _countryController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Country",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: const Icon(Icons.home_filled),
                      labelText: "City",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _idNumberController,
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: const Icon(Icons.phone_android_rounded),
                      labelText: "Phone Number",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _nationalIdController,
                    keyboardType: TextInputType.number,
                    maxLength: 14,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "National ID",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: _secureText,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      labelStyle: const TextStyle(color: Colors.black),
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
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.text,
                    obscureText: _secureTextConfirm,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Confirm Password",
                      labelStyle: const TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _secureTextConfirm = !_secureTextConfirm;
                          });
                        },
                        icon: Icon(_secureTextConfirm ? Icons.visibility_off : Icons.visibility, size: 22),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButtonFormField<String>(
                    value: _userType,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "User Type",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                    items: <String>['User', 'Worker']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _userType = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _jobController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.greenAccent),
                        borderRadius: BorderRadius.circular(13),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.brown),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Job (only worker)",
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: GestureDetector(
                    child: Container(
                      child: MaterialButton(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        minWidth: 150,
                        shape: const StadiumBorder(),
                        color: Colors.purple,
                        textColor: Colors.black,
                        onPressed: () {
                          _insertUser();
                          Navigator.of(context).pop(); // Go back to the previous screen
                        },
                        child: const Text("Sign in"),
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
