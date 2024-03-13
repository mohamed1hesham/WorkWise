// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/tast/Login.dart';
// import 'package:flutter_application_1/model/server_user.dart';

// final _formKey = GlobalKey<FormState>();

// class New extends StatefulWidget {
//   const New({Key? key}) : super(key: key);

//   @override
//   State<New> createState() => _New();
// }

// class _New extends State<New> {
//   bool _secureText = true;
//   bool _confirmSecureText = true;
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _nationalIdController = TextEditingController(); // تعريف المتحكم لـ national ID

//   @override
//   void dispose() {
//     super.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _nationalIdController.dispose(); // تحرير المتحكم عند التخلص من الصفحة
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('images/BK.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Center(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'images/hard-work.png',
//                     height: 150,
//                   ),
//                   SizedBox(height: 50),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _nationalIdController, // استخدام المتحكم هنا
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.greenAccent),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Color.fromARGB(255, 174, 137, 180)),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         labelText: "National ID", // تسمية الحقل
//                         labelStyle: TextStyle(color: Colors.black),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter your National ID';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 7),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _passwordController,
//                       obscureText: _secureText,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.greenAccent),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Color.fromARGB(255, 174, 137, 180)),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         labelText: "New Password",
//                         labelStyle: TextStyle(color: Colors.black),
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               _secureText = !_secureText;
//                             });
//                           },
//                           icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility, size: 22),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter a new password';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 7),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     child: TextFormField(
//                       keyboardType: TextInputType.text,
//                       controller: _confirmPasswordController,
//                       obscureText: _confirmSecureText,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.greenAccent),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Color.fromARGB(255, 174, 137, 180)),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         labelText: "Confirm Password",
//                         labelStyle: TextStyle(color: Colors.black),
//                         suffixIcon: IconButton(
//                           onPressed: () {
//                             setState(() {
//                               _confirmSecureText = !_confirmSecureText;
//                             });
//                           },
//                           icon: Icon(_confirmSecureText ? Icons.visibility_off : Icons.visibility, size: 22),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please confirm your password';
//                         } else if (value != _passwordController.text) {
//                           return 'Passwords do not match';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                   SizedBox(height: 50),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 3),
//                     child: GestureDetector(
//                       child: Container(
//                         child: MaterialButton(
//                           padding: const EdgeInsets.symmetric(vertical: 15),
//                           minWidth: 150,
//                           shape: const StadiumBorder(),
//                           color: Colors.purple,
//                           textColor: Colors.black,
//                           onPressed: () async {
//                             if (_formKey.currentState!.validate()) {
//                               String newPassword = _passwordController.text;
//                               bool passwordUpdated = await ServerUserAPI.updatePassword(_nationalIdController.text, newPassword);
//                               if (passwordUpdated) {
//                                 Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
//                               } else {
//                                 showDialog(
//                                   context: context,
//                                   builder: (BuildContext context) {
//                                     return AlertDialog(
//                                       title: Text("Error"),
//                                       content: Text("Failed to update password."),
//                                       actions: [
//                                         TextButton(
//                                           onPressed: () {
//                                             Navigator.of(context).pop();
//                                           },
//                                           child: Text("OK"),
//                                         ),
//                                       ],
//                                     );
//                                   },
//                                 );
//                               }
//                             }
//                           },
//                           child: Text("Next"),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 50),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
