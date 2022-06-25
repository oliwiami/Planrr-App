import 'package:flutter/material.dart';
import 'package:planrr/services/auth.dart';


class SignIn extends StatefulWidget {

  final Function? toggleView;
  SignIn({this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _authService = AuthService();

  String email ='';
  String password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Sign in to Planrr'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            textColor: Colors.white,
            onPressed: (){
              widget.toggleView!();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                onChanged: (val){
                  setState(() => email=val);
                }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  onChanged: (val){
                  setState(() => password=val);
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text('Sign in', style: TextStyle(color: Colors.white)),
                  onPressed: () async{
                    print(email);
                    print(password);
                  },
                  )
            ],
          ),
        )
      ),
    );
  }
}