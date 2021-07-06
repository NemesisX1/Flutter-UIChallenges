import 'package:flutter/material.dart';

class StatsView extends StatefulWidget {
  StatsView({Key? key}) : super(key: key);

  @override
  _StatsViewState createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text("StatsView"),
        ],
      ),
    );
  }
}
