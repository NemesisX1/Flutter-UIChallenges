import 'package:flutter/material.dart';

class EmptyView extends StatefulWidget {
  EmptyView({Key? key}) : super(key: key);

  @override
  _EmptyViewState createState() => _EmptyViewState();
}

class _EmptyViewState extends State<EmptyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: ListView(
        children: [
          Text("EmptyView"),
        ],
      ),
    );
  }
}
