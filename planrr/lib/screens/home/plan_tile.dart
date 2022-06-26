import 'package:flutter/material.dart';
import 'package:planrr/models/plan.dart';
import 'package:planrr/screens/home/plan_screen.dart';

class PlanTile extends StatelessWidget {

final Plan plan;
PlanTile({required this.plan});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          //trailing: Text(plan!.date.toString()),
          title: Text(plan.title),
          subtitle: Text(plan.description),
          isThreeLine: true,
          onTap: (){Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PlanScreen(plan: plan,)));},
        )
      )
    );
  }
}