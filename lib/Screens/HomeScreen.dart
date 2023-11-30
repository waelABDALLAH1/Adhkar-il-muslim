import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/section_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SectionModel> sections=[];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("Adhkar il Muslim "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            buildSectionItem(text: "Adhkar il sabeh"),
            buildSectionItem(text: "Adhkar il Mase2"),
            buildSectionItem(text: "Adhkar il salet "),
          ],
        ),
      ),
    );
  }

  Widget buildSectionItem({required String text}) {
    return Container(
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        height: 100,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.lightGreenAccent,
              Colors.green,
              Colors.lightGreen,

            ]

          )

        ),
        child: Center(
            child: Text(
          "$text",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
          ),
        )));
  }


  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database/Section_db.json")
        .then((data) {
      var response = json.decode(data);

      response.forEach((section) {
        SectionModel _section = SectionModel.fromJson(section);
        sections.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
}
}

