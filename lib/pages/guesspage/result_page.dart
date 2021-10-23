import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/resultPage';

  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("GUESS TEACHER'S AGE"),
      ),
      body: Container(
        color: Colors.blueAccent.shade100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'อายุอาจารย์',
                style: GoogleFonts.mali(fontSize: 45,fontWeight: FontWeight.bold,color: Colors.purple),
              ),
            ),
            Center(
              child: Text(
                '46 ปี 10 เดือน',
                style: GoogleFonts.mali(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.check, color: Colors.green,size: 100.0,),
            )
          ],
        ),
      ),
    );
  }
}
