// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:planrr/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:planrr/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:planrr/models/my_user.dart';

import 'package:planrr/main.dart';

void main() async{
  test('Initialize app from firestore',()async{ 
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
});
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
