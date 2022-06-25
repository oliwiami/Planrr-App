import 'package:flutter/material.dart';
import 'package:planrr/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import '../models/my_user.dart';
import 'home/home.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);
    
    if(user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}