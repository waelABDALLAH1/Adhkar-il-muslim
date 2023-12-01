import 'dart:convert';

import 'package:adhkar/Screens/section_detail_screen.dart';
import 'package:flutter/material.dart';

import '../models/section_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<SectionModel> sections = [];

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
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildSectionItem(model : sections[index]),
            itemCount: sections.length,
          )),
    );
  }

  Widget buildSectionItem({required SectionModel model }) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SectionDetailScreen(id :model.id! , )));


      },
      child: Container(
          margin: const EdgeInsets.only(top: 12.0),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                Colors.lightGreenAccent,
                Colors.green,
                Colors.lightGreen,
              ])),
          child: Center(
              child: Text(
            "${model.name}",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ))),
    );
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
