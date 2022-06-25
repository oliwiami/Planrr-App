import 'package:cloud_firestore/cloud_firestore.dart';

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
 // Future updateUserData(String password) async{
    //this will be a function to change password for a logged user
  //}
}