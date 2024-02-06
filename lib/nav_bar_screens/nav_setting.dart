import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List data = [];
  bool loding = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Container(
          height: 50,
          alignment: Alignment.topCenter,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          child: InkWell(
            child: Text(
              "Click to show data",
              style: TextStyle(fontSize: 30, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            onTap: () async {
              loding = true;
              setState(() {});
              var respo = await get(
                  Uri.parse("https://jsonplaceholder.typicode.com/posts"));
              var respobody = jsonDecode(respo.body);
              data.addAll(respobody);
              loding = false;
              setState(() {});
            },
          )),
      if (loding)
        Center(
          child: CircularProgressIndicator(),
        ),
      ...List.generate(
          data.length,
          (index) => Card(
                child: ListTile(
                  title: Text("${data[index]['title']}"),
                  subtitle: Text("${data[index]['body']}"),
                ),
              ))
    ]));
  }
}
