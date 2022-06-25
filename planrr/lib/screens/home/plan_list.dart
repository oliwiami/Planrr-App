import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:planrr/models/plan.dart';

class PlanList extends StatefulWidget {

  @override
  State<PlanList> createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  @override
  Widget build(BuildContext context) {
    final plans = Provider.of<List<Plan>?>(context);
    plans!.forEach((plan) {
      print(plan.title);
      print(plan.description);
      print(plan.date);
      print(plan.uid);
    });
    return Container(
      
    );
  }
}