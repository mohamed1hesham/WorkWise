import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/model/server_user.dart';
import 'package:flutter_application_1/tast/forgetPassword.dart';

void main() {
  runApp(SearchPage());
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _searchText = '';
  final List<String> _data = [
    'جيزه',
    'الجيزه',
    'القاهره',
    'apologize',
    'Army',
    'Arm',
    'appointment',
    'banana',
    'grape',
    'orange',
    'watermelon',
    'pear',
  ];
  List<String> _filteredData = [];

  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();

  void _onSearchTextChanged(String value) {
    setState(() {
      _searchText = value;
      _filteredData =
          _data.where((item) => item.contains(_searchText)).toList();
    });
  }

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
        shadowColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 138, 164, 250),
        title: const Text('Home user'),
        actions: [
          IconButton(
            iconSize: 25,
            icon: const Icon(Icons.search),
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.all(40),
          child: ListView(
            children: [
              const Row(
                children: [
                  CircleAvatar(radius: 30,),
                  Expanded(
                    child: ListTile(
                      title: Text("HAND WORK", style: TextStyle(fontSize: 15),),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
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
                title: GestureDetector(
                  child: const Text("Log out"),
                ),
                leading: const Icon(Icons.logout),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('LoginScreen');
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 233, 233),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: _onSearchTextChanged,
                      decoration: const InputDecoration(
                        hintText: ' search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_filteredData[index]),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.bottomLeft,
              margin: const EdgeInsets.only(right: 270),
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color.fromARGB(255, 138, 164, 250),        
              ),
              child: IconButton(
                color: Colors.black,
                iconSize: 30,
                icon: const Icon(Icons.chat),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
