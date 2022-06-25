import 'package:flutter/material.dart';
import 'package:planrr/shared/constants.dart';

import '../../services/auth.dart';
import '../../shared/loading.dart';

class Register extends StatefulWidget {

  final Function? toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  
  //text field state
  String email ='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Register to Planrr'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.login),
            label: Text('Sign in'),
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
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val!.isEmpty ? 'Enter an email':null,
                onChanged: (val){
                  setState(() => email=val);
                }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Password'),
                  obscureText: true,
                  validator: (val) => val!.length < 6 ? 'Enter a password at least 6 characters long':null,
                  onChanged: (val){
                  setState(() => password=val);
                  },
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text(
                    'Register now', 
                    style: TextStyle(color: Colors.white)),
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      setState(() => loading = true);
                      dynamic result = await _authService.registerWithEmailAndPassword(email, password);
                      if(result == null){
                        setState(() { 
                          error ='please supply a valid email';
                          loading = false;
                        });
                      }
                    }
                  },
                  ),
                  SizedBox(
                    height: 12.0),
                  Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
            ],
          ),
        )
      ),
    );
  }
}