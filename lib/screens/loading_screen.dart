import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products",
          style: TextStyle(color: Colors.indigo),
        ),
      ),
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.indigoAccent,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),
        ),
      ),
    );
  }
}
