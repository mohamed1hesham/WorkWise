import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/server.dart';
import 'package:flutter_application_1/tast/user.dart';
import 'package:flutter_application_1/tast/forgetPassword.dart';
import 'package:flutter_application_1/tast/home.dart';

final _formKey = GlobalKey<FormState>();

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
  bool _secureText = true;
  final _nationalIDController = TextEditingController();
  final _passwordController = TextEditingController();

  void openHomeScreen() {
    Navigator.of(context).pushReplacementNamed('HomeScreen');
  }

  LOGIN_TABLE() {
    Services.createTable().then((result) {
      if ('success' == result) {
        print('success to create table');
      } else {
        print('failed to create table');
      }
    });
  }

  void insertUserCredentials() {
    Services.insertUserCredentials(
      _nationalIDController.text,
      _passwordController.text,
    ).then((result) {
      if (result == 'success') {
        print('User credentials inserted successfully');
      } else {
        print('Failed to insert user credentials');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _nationalIDController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'images/BK.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    'images/hard-work.png',
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextFormField(
                              controller: _nationalIDController,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              maxLength: 14,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.greenAccent),
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Color.fromARGB(255, 174, 137, 180)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                hintText: "National ID",
                                hintStyle: const TextStyle(color: Colors.black54, fontSize: 17.5),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your National ID';
                                } else if (value.length != 14) {
                                  return 'National ID must be 14 digits';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _passwordController,
                          obscureText: _secureText,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color.fromARGB(255, 174, 137, 180)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(color: Colors.black54, fontSize: 17.5),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _secureText = !_secureText;
                                });
                              },
                              icon: Icon(
                                _secureText ? Icons.visibility_off : Icons.visibility,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5),
                      MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                        },
                        child: const Text('Forget Password ?'),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                LOGIN_TABLE();
                                insertUserCredentials();
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                              }
                            },
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            minWidth: 150,
                            shape: const StadiumBorder(),
                            color: Colors.purple,
                            textColor: Colors.black,
                            child: const Text("Sign In "),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const user()));
                            },
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            minWidth: 150,
                            shape: const StadiumBorder(),
                            color: Colors.green,
                            textColor: Colors.black,
                            child: const Text("Sign Up"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
