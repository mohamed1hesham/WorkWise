import 'package:flutter/material.dart';



class WorkerPage extends StatefulWidget {
  const WorkerPage({Key? key});

  @override
  _WorkerPageState createState() => _WorkerPageState();
}

class _WorkerPageState extends State<WorkerPage> {
  TextEditingController _postController = TextEditingController();

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
                      height: 400, // تحديد ارتفاع النافذة
                      width: 400, // تحديد عرض النافذة
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Create post',style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20 
                          ),), // إضافة النص
                          const SizedBox(height: 16), // تباعد بين النص وحقل النص
                          TextFormField(
                            maxLines: 9,
                            controller: _postController,
                            decoration: const InputDecoration(
                              hintText: 'Type your message here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 30), // تباعد بين حقل النص والأزرار
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container( width: 200, 
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color.fromARGB(255, 138, 164, 250),),
                              padding: EdgeInsets.all(5.0),
                                child: TextButton(
                                  onPressed: () {
                                    // Add logic to handle submitted post
                                    // Clear the text field
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
                      height: 400, // تحديد ارتفاع النافذة
                      width: 400, // تحديد عرض النافذة
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Create post',style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20 
                          ),), // إضافة النص
                          const SizedBox(height: 16), // تباعد بين النص وحقل النص
                          TextFormField(
                            maxLines: 9,
                            controller: _postController,
                            decoration: const InputDecoration(
                              hintText: 'Type your message here...',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 30), // تباعد بين حقل النص والأزرار
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container( width: 200, 
                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)),
                              color: Color.fromARGB(255, 138, 164, 250),),
                              padding: EdgeInsets.all(5.0),
                                child: TextButton(
                                  onPressed: () {
                                    // Add logic to handle submitted post
                                    // Clear the text field
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
              title: const Text('Account'),
              onTap: () {
                // Navigate to profile screen
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                // Navigate to friends screen
              },
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
                // Navigate to settings screen
              },
            ),
          ],
        ),
      ),
      body: Container(), // Your main content here
    );
  }
}
