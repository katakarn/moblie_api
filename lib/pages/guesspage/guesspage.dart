import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moblie_api/pages/guesspage/result_page.dart';
import 'package:http/http.dart' as http;

class GuessPage extends StatefulWidget {
  static const routeName = '/guessPage';

  const GuessPage({Key? key}) : super(key: key);

  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  int year = 0;
  int month = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("GUESS TEACHER'S AGE"),
      ),
      body: Container(
        color: Colors.blueAccent.shade100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'อายุอาจารย์',
                  style: GoogleFonts.mali(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.blueAccent),
                ),
              ),
            ),
            Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SpinBox(
                              min: 0,
                              max: 120,
                              value: 0,
                              onChanged: (value) => setState(() {
                                year = value as int;
                              }),
                              textStyle: Theme.of(context).textTheme.headline1,
                              decoration: InputDecoration(
                                  labelText: 'ปี',
                                  labelStyle:
                                  Theme.of(context).textTheme.headline1)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SpinBox(
                              min: 0,
                              max: 12,
                              value: 0,
                              onChanged: (value) => setState(() {
                                month = value as int;
                              }),
                              textStyle: Theme.of(context).textTheme.headline1,
                              decoration: InputDecoration(
                                  labelText: 'เดือน',
                                  labelStyle:
                                  Theme.of(context).textTheme.headline1)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            onPressed: () {
                              submit('guess_teacher_age',
                                  {'year': year, 'month': month});
                            },
                            child: Text(
                              'ทาย',
                              style: GoogleFonts.mali(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(150, 50),
                                primary: Colors.red,
                          ),)
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _showMaterialDialog(String str) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "ผลการทาย",
            style: TextStyle(color: Colors.black),
          ),
          content: Text(str),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> submit(
      String endPoint,
      Map<String, dynamic> params,
      ) async {
    var BASE_URL = 'https://cpsu-test-api.herokuapp.com';
    var url = Uri.parse('$BASE_URL/$endPoint');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(params),
    );

    if (response.statusCode == 200) {
      Map<dynamic, dynamic> jsonBody = json.decode(response.body);
      String status = jsonBody['status'];
      String? message = jsonBody['message'];
      Map<String, dynamic> data = jsonBody['data'];

      if (data['value'] == true) {
        Navigator.pushReplacementNamed(context,ResultPage.routeName);
      } else {
        _showMaterialDialog(data['text']);
      }
    } else {
      Map<dynamic, dynamic> jsonBody = json.decode(response.body);
      Map<String, dynamic> data = jsonBody['data'];
      _showMaterialDialog(data['text']);
    }
  }
}
