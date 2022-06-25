import 'package:flutter/material.dart';
import 'package:planrr/services/auth.dart';

class Home extends StatelessWidget{

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Planrr'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.logout),
            label: Text('logout'),
            textColor: Colors.white,
            onPressed: () async{
              await _auth.signOut();
            },
          )
        ],
      ),
    );
  }

}