import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planrr/screens/settings/info_card.dart';

// our data
const url = "meshivanshsingh.me";
const email = "me.shivansh007@gmail.com";
const phone = "90441539202"; // not real number :)
const location = "Lucknow, India";

class Settings extends StatelessWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planrr'),
        backgroundColor: Colors.blue,
      ),
        backgroundColor: Colors.white,
        body: SafeArea(
          minimum: const EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('./avatar.png'),
              ),
              Text(
                "My account",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Change settings",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.blueGrey[200],
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold,),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.lightBlue,
                ),
              ),

              // we will be creating a new widget name info carrd

              InfoCard(text: _auth.currentUser!.email.toString(), icon: Icons.email),
              InfoCard(text: 'Password', icon: Icons.password),
              InfoCard(text:'Notifications', icon: Icons.notifications),
              InfoCard(text:'Help', icon: Icons.help),
              InfoCard(text: 'Report issues', icon: Icons.report),
            ],
          ),
        ));
  }
}