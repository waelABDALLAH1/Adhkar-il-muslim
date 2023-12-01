import 'package:adhkar/models/section_detail_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class SectionDetailScreen extends StatefulWidget {
  final int id;
  final String title;

  const SectionDetailScreen({super.key, required this.id ,required this.title});

  @override
  State<SectionDetailScreen> createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionDetailScreen> {
  List<SectionDetailModel> sectiondetail = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSectionDetail();
  }
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),

            itemBuilder: (context , index ) {
              return Container(

                decoration: BoxDecoration(
                    color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3)
                    )
                  ]
                ),

                child: ListTile(
                  title: Text("${sectiondetail[index].reference}" , textDirection: TextDirection.rtl),
                  subtitle: Text("${sectiondetail[index].content}" , textDirection: TextDirection.rtl , style:  TextStyle (
                    fontSize: 18
                  )
                    ,),
                ),
              );
            },
            separatorBuilder: (context , index ) => Divider(height: 2,color: Colors.grey.withOpacity(.8),),
            itemCount: sectiondetail.length),
      ),
    );
  }

  loadSectionDetail() async {
    sectiondetail =[];
    DefaultAssetBundle.of(context)
        .loadString("assets/database/Section_details_db.json")
        .then((data) {
      var response = json.decode(data);

      response.forEach((section) {
        SectionDetailModel _detailsection =
            SectionDetailModel.fromJson(section);
        if( _detailsection.sectionId == widget.id){
          sectiondetail.add(_detailsection);
        }

      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
