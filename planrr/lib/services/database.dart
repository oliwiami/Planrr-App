
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:planrr/models/plan.dart';

class DatabaseService{

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
      return snapshot.docs.map((d){
        return Plan(
          title: d.get('title')??'',
          description: d.get('description')??'',
          date: d.get('date').toDate()??DateTime.now(),
          uid: d.get('uid')??''
        );
      }).toList();
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


 // Future updateUserData(String password) async{
    //this will be a function to change password for a logged user
  //}
}