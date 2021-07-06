import 'package:flutter/material.dart';
import 'views/baseView.dart';
import 'helpers/constant.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Finance UI',
      theme: appGlobalTheme,
      home: BaseView(
        key: UniqueKey(),
      ),
    );
  }
}
