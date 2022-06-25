import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:planrr/models/plan.dart';
import 'package:planrr/screens/home/plan_tile.dart';

class PlanList extends StatefulWidget {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  State<PlanList> createState() => _PlanListState();
}

class _PlanListState extends State<PlanList> {
  @override
  Widget build(BuildContext context) {
    final plans = Provider.of<List<Plan>?>(context) ?? [];
    
    /*plans.forEach((plan) {
      print(plan.title);
      print(plan.description);
      print(plan.date);
      print(plan.uid);
    });*/
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index){
        return PlanTile(plan: plans[index]);
      },
    );
  }
}