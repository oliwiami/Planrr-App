import 'package:flutter/material.dart';
import 'package:planrr/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:planrr/services/auth.dart';
import 'package:provider/provider.dart';

import 'models/my_user.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
      home: Wrapper(),
      ),
    );
  }
}

