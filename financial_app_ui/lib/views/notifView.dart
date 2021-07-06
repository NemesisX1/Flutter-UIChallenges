import 'package:flutter/material.dart';

class NoticationsView extends StatefulWidget {
  NoticationsView({Key? key}) : super(key: key);

  @override
  _NoticationsViewState createState() => _NoticationsViewState();
}

class _NoticationsViewState extends State<NoticationsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text("NoticationsView"),
        ],
      ),
    );
  }
}
