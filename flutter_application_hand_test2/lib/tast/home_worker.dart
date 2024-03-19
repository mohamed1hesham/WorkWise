import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/server_user.dart';
import 'package:flutter_application_1/tast/forgetPassword.dart';



class WorkerPage extends StatefulWidget {
  const WorkerPage({Key? key});

  @override
  _WorkerPageState createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {
  TextEditingController _postController = TextEditingController();

  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();

    void _getUserInfo() async {
    String nationalId = _nationalIdController.text;
    String password = _idNumberController.text;

    
    Map<String, dynamic> userInfo = await ServerUserAPI.getUserInfo(nationalId, password);

    if (userInfo['status'] == 'success') {
      
showDialog(
  context: context,
  barrierDismissible: false,
  builder: (BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
              alignment: Alignment.topRight,
            ),
            Text(
              "User Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text("National ID"),
              subtitle: Text("${userInfo['user_info']['national_id']}"),
            ),
            ListTile(
              title: Text("First Name"),
              subtitle: Text("${userInfo['user_info']['first_name']}"),
            ),
            ListTile(
              title: Text("Last Name"),
              subtitle: Text("${userInfo['user_info']['last_name']}"),
            ),
            ListTile(
              title: Text("Country"),
              subtitle: Text("${userInfo['user_info']['country']}"),
            ),
            ListTile(
              title: Text("City"),
              subtitle: Text("${userInfo['user_info']['city']}"),
            ),
            ListTile(
              title: Text("ID Number"),
              subtitle: Text("${userInfo['user_info']['id_number']}"),
            ),
            ListTile(
              title: Text("User Type"),
              subtitle: Text("${userInfo['user_info']['user_type']}"),
            ),
          ],
        ),
      ),
    );
  },
);

    } else {
      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Failed to retrieve user information"),
          );
        },
      );
    }
  }

void _contactUs() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), 
        ),
        child: SizedBox( 
          width: 250, 
          height: 200, 
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'To send complaints, inquiries, or any other issues related to our application, you can contact us via email:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: 'handdworkk845@gmail.com'));
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email copied')));
                  },
                  child: Text(
                    'handdworkk845@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeWork',style:TextStyle(
          fontWeight: FontWeight.bold
        ) ,),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.post_add_rounded),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      height: 400, 
                      width: 400, 
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Create post',style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20 
                          ),), 
                          const SizedBox(height: 16), 
                          TextFormField(
                            maxLines: 9,
                            controller: _postController,
                            decoration: const InputDecoration(
                              hintText: 'Type your message here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 30), 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container( width: 200, 
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color.fromARGB(255, 138, 164, 250),),
                              padding: EdgeInsets.all(5.0),
                                child: TextButton(
                                  onPressed: () {
                                    
                                    
                                    _postController.clear();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Post',style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,color: Colors.white,
                                  ) ,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.photo),
            color:Colors.green,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      height: 400, 
                      width: 400, 
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Create post',style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20 
                          ),), 
                          const SizedBox(height: 16), 
                          TextFormField(
                            maxLines: 9,
                            controller: _postController,
                            decoration: const InputDecoration(
                              hintText: 'Type your message here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 30), 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container( width: 200, 
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color.fromARGB(255, 138, 164, 250),),
                              padding: EdgeInsets.all(5.0),
                                child: TextButton(
                                  onPressed: () {
                                    
                                    
                                    _postController.clear();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Post',style:TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,color: Colors.white,
                                  ) ,),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
              ListTile(
                title: const Text("Account"),
                leading: const Icon(Icons.person),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("User Information"),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _nationalIdController,
                                maxLength: 14,
                                decoration: InputDecoration(
                                  labelText: "National ID",
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(14),
                                ],
                              ),
                              SizedBox(height: 20), 
                              TextField(
                                controller: _idNumberController,
                                maxLength: 11,
                                decoration: InputDecoration(
                                  labelText: "Phone Number",
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(14),
                                ],
                              ),
                              SizedBox(height: 20), 
                              Align(
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: _getUserInfo, 
                                  child: Text("OK"),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPassword()));
                                },
                                child: Text("Change Password"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text("About"),
                onTap: _contactUs,
              ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('LoginScreen');
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                
              },
            ),
          ],
        ),
      ),
      body: Container(), 
    );
  }
}
