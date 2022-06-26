import 'package:flutter/material.dart';
import 'package:planrr/models/plan.dart';
import 'package:planrr/screens/home/home.dart';
import 'package:planrr/shared/constants.dart';

class PlanScreen extends StatelessWidget {

    final Plan plan;
    PlanScreen({required this.plan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Planrr'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                title: Text(plan.title),
                subtitle: Text('Title'),
                trailing: Icon(Icons.edit),
                ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                title: Text(plan.date.toString()),
                subtitle: Text('Due date'),
                trailing: Icon(Icons.edit),
                ),
            ),
            Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                title: Text(plan.description),
                trailing: Icon(Icons.edit),
                ),
            ),
          ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        backgroundColor: Colors.red,
        onPressed: () => { 
          Navigator.push(
          context, 
           MaterialPageRoute(builder: ((context) =>  Home()))
           ),
        }
      ),
    );    
  }
}
