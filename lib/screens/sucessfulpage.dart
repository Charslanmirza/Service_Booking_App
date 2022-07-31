import 'package:flutter/material.dart';

class Successful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Text('Successfully entered'),
    );
  }
}
