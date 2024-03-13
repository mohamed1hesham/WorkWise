import 'package:flutter/material.dart';
import 'package:flutter_application_1/tast/forgetPassword.dart';

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

  void _onSearchTextChanged(String value) {
    setState(() {
      _searchText = value;
      _filteredData =
          _data.where((item) => item.contains(_searchText)).toList();
    });
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
              // Navigate to search screen when search icon is pressed
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
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Name: John Doe"), // استبدل هذا بالاسم الحقيقي للمستخدم
                            Text("National ID: 1234567890"), // استبدل هذا بالـ national ID الحقيقي للمستخدم
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPassword()));
                              },
                              child: Text("Change Password"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: const Text("About"),
                leading: const Icon(Icons.help),
                onTap: () {
                  // Handle about tap
                },
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
