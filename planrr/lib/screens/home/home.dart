import 'package:flutter/material.dart';
import 'package:planrr/services/auth.dart';
import 'package:planrr/services/database.dart';
import 'package:provider/provider.dart';
import 'package:planrr/screens/home/plan_list.dart';
import 'package:planrr/models/plan.dart';
import 'package:planrr/screens/home/sidemenu.dart';

class Home extends StatelessWidget{

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Plan>?>.value( 
      value: DatabaseService().plans,
      initialData: null,
      child: Scaffold(
      drawer: NavDrawer(), 
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Planrr'),
        backgroundColor: Colors.blue,
      ),
      body: PlanList(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: (){
          print('clicked the button');
        },
      ),
    )
    );
  }

}