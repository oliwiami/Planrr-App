import 'package:flutter/material.dart';

class Settings extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            const Icon(Icons.person),
            Text('Change email'),
            Text('Change password', style: TextStyle(color: Colors.red),)
          ],
        ),
    )
    );
  }
}