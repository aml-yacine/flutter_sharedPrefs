import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_lab_4/saveData.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  String name = '';
  late SharedPreferences prefs;

  //to read data from shared prefs
  retrieveData() async {
    prefs = await SharedPreferences.getInstance();
    var text = prefs.getString('my_data');
    setState(() {
      this.name = text ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Retrieve Data .."),
      ),
      body: Center(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(30),
            child: ElevatedButton(
              child: Text('Retrieve Data'),
              onPressed: () {
                retrieveData();
                print(name);
              },
            ),
          ),
          Container(
            child: Text(
              'Stored Data : ${name}',
              style: TextStyle(fontSize: 20),
            ),
          )
        ]),
      ),
    );
  }
}
