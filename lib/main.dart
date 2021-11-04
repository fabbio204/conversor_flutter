// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'app/view/home_view.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SafeArea(child: HomeView()),
    );
  }
}
