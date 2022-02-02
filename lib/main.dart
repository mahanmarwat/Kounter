import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import "package:google_fonts/google_fonts.dart";

main() {
  runApp(Kounter());
}

class Kounter extends StatefulWidget {
  @override
  _KounterState createState() => _KounterState();
}

class _KounterState extends State<Kounter> {
  static int counter = 0;

  void initState() {
    super.initState();
    load_data();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "KOUNTER",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: KounterBody(),
        floatingActionButton: FloatingActionButton(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          child: Icon(Icons.add),
          onPressed: () {
            if (counter == 99) {
              counter = 0;
            }
            counter++;
            setState(() {});
          },
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.mcLaren().fontFamily,
      ),
    );
  }

  Future<void> load_data() async {
    dynamic unparsed_json = await rootBundle.loadString("assets/data.json");
    Map<String, dynamic> json = jsonDecode(unparsed_json);
    counter = json["counter"];
    setState(() {});
  }
}

class KounterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Center(
          child: Text(
            _KounterState.counter.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              // backgroundColor: Colors.red,
              fontSize: 120,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        width: 300,
        height: 300,
        decoration: BoxDecoration(color: Colors.yellow.shade800, borderRadius: BorderRadius.all(Radius.circular(150))),
      ),
    );
  }
}
