import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planrr/models/plan.dart';
import 'package:planrr/services/auth.dart';

class DatabaseService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final String? planid;
  DatabaseService({this.planid});

  // collection reference
  final CollectionReference planCollection = FirebaseFirestore.instance.collection('plans');

  

  //creating a new plan for a logged user
  Future createPlan(String title, String description, DateTime date, String uid) async{
    return await planCollection.doc(planid).set({
      'title':title,
      'description':description,
      'date':date,
      'uid':uid
  });
  }

  //plan list from snapshot
  List<Plan> _planListFromSnapshot(QuerySnapshot snapshot){
    try{
      /*return snapshot.docs.map((d){
        return Plan(
          title: d.get('title')??'',
          description: d.get('description')??'',
          date: d.get('date').toDate()??DateTime.now(),
          uid: d.get('uid') ?? ''
        );
      }).toList();*/
      List<Plan> newPlans = snapshot.docs.map((d){
        return Plan(
          title: d.get('title')??'',
          description: d.get('description')??'',
          date: d.get('date').toDate()??DateTime.now(),
          uid: d.get('uid') ?? ''
        );
      }).toList();
      List<Plan> filteredPlans =[];
      for(int i=0; i<newPlans.length; i++){
        if(newPlans[i].uid == _auth.currentUser!.uid){
           filteredPlans.add(newPlans[i]);
        }
      }
      return filteredPlans;
    }catch(e){
      print(e);
      return [];
    }
  }

  //get plan stream
  Stream<List<Plan>> get plans{
    return planCollection.snapshots()
      .map(_planListFromSnapshot);
  }

  //get plan doc stream
  Stream<DocumentSnapshot> get planData{
    print(_auth.currentUser!.uid);
    return planCollection.doc(planid).snapshots();
  }
}