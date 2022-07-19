import 'package:flutter/material.dart';
import 'package:flutter_lab_4/retrieveData.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = '';
  final myController = TextEditingController();

//instance from shared prefs
  late SharedPreferences prefs;

// to stored data in shared prefs
  saveData(String text) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString("my_data", text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Prefrences'),
      ),
      body: Center(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: TextField(
              controller: myController,
              decoration: InputDecoration(hintText: 'Enter Your Name..'),
            ),
          ),
          Container(
            child: ElevatedButton(
              child: Text('Save Data'),
              onPressed: () {
                saveData(myController.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetData()),
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
