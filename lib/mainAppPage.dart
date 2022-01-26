import 'package:flutter/material.dart';
import 'package:gighub/main_drawer.dart';

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MainDrawer(),
    );
  }
}
