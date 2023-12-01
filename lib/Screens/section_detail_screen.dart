import 'package:flutter/material.dart';


class SectionDetailScreen extends StatelessWidget {
  final int id;
  const SectionDetailScreen({super.key , required this.id });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("$id")),

    );
  }
}
