import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/server_user.dart';
import 'package:flutter_application_1/tast/Login.dart';

void main() {
  runApp(ForgetPassword());
}

class ForgetPassword extends StatelessWidget {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nationalIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgetPasswordPage(
        phoneNumberController: _phoneNumberController,
        nationalIDController: _nationalIDController,
        passwordController: _passwordController,
        confirmPasswordController: _confirmPasswordController,
      ),
    );
  }
}

class ForgetPasswordPage extends StatefulWidget {
  final TextEditingController phoneNumberController;
  final TextEditingController nationalIDController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const ForgetPasswordPage({
    Key? key,
    required this.phoneNumberController,
    required this.nationalIDController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  bool _secureText = true;
  bool _secureTextConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"), // عنوان الصفحة
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // أيقونة العودة
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen())); // فتح صفحة تسجيل الدخول
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/BK.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 5),
                    Image.asset('images/hard-work.png', height: constraints.maxHeight * 0.2),
                    SizedBox(height: constraints.maxHeight * 0.1),
                    // Phone Number TextField
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
                      child: TextField(
                        controller: widget.phoneNumberController,
                        keyboardType: TextInputType.number,
                        maxLength: 11,
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
                          labelText: "Phone Number",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    // National ID TextField
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
                      child: TextField(
                        controller: widget.nationalIDController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        maxLength: 14,
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
                          suffix: Icon(Icons.person),
                          labelText: "National ID",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.1),
                    // Password TextField
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
                      child: TextFormField(
                        controller: widget.passwordController,
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
                    SizedBox(height: constraints.maxHeight * 0.05),
                    // Confirm Password TextField
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
                      child: TextFormField(
                        controller: widget.confirmPasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: _secureTextConfirm,
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
                                _secureTextConfirm = !_secureTextConfirm;
                              });
                            },
                            icon: Icon(_secureTextConfirm ? Icons.visibility_off : Icons.visibility, size: 22),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.1),
                    // Change Password Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.02),
                      child: GestureDetector(
                        child: Container(
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.03),
                            minWidth: constraints.maxWidth * 0.3,
                            shape: const StadiumBorder(),
                            color: Colors.purple,
                            textColor: Colors.black,
                            onPressed: () {
                              _handleChangePasswordButtonPressed();
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Text("Change Password"),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _handleChangePasswordButtonPressed() async {
    String phoneNumber = widget.phoneNumberController.text;
    String nationalID = widget.nationalIDController.text;
    String password = widget.passwordController.text;

    Map<String, dynamic> result = await ServerUserAPI.checkPhoneNumber(phoneNumber, nationalID, password);

    if (result['status'] == 'success') {
      String retrievedPassword = result['password'];
      setState(() {
        widget.passwordController.text = retrievedPassword; // تحديث كلمة المرور المعروضة
      });
    } else {
      setState(() {
        // عرض مربع الحوار برسالة الخطأ
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Phone number or national ID does not exist."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // عرض مربع الحوار بنجاح العملية عند فتح الصفحة
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showSuccessDialog();
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Success"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Operation Successful",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                "When your information is complete and you press the change password button, if you do not see an error message, know that the process was completed successfully.",
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
