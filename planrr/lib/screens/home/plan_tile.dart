import 'package:flutter/material.dart';
import 'package:planrr/models/plan.dart';

class PlanTile extends StatelessWidget {

final Plan? plan;
PlanTile({this.plan});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text(plan!.title),
          subtitle: Text(plan!.description),
        )
      )
    );
  }
}