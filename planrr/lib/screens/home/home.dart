import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planrr/models/my_user.dart';
import 'package:planrr/services/auth.dart';
import 'package:planrr/services/database.dart';
import 'package:planrr/shared/constants.dart';
import 'package:provider/provider.dart';
import 'package:planrr/screens/home/plan_list.dart';
import 'package:planrr/models/plan.dart';
import 'package:planrr/screens/home/sidemenu.dart';
import 'package:planrr/services/auth.dart';

class Home extends StatelessWidget{

  final AuthService _auth = AuthService();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        icon: Icon(Icons.add),
        label: Text('Add plan'),
        onPressed: () =>
          showDialog(
            context: context, 
            builder: (context) => AlertDialog(
            title: Text('Add plan'),
            content: Form(
              key: _formKey,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Enter title'),
                    controller: _titleController,
                    validator: (val){
                      if (val == null || val.isEmpty){
                        return 'Please enter a title';
                      }
                      return null;
                    },                                 
                  ),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'Enter description'),
                    validator: (val) {
                      if (val == null || val.isEmpty){
                        return 'Please enter a describtion';
                      }
                      
                      return null;
                    },
                    controller: _descController,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed:() => Navigator.pop(context),
                child: const Text('Cancel')
                ),
                TextButton(
                  child: Text('Add'),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      _auth.addPlan( _titleController.text, _descController.text, DateTime.now());
                    Navigator.pop(context);
                    _titleController.clear();
                    _descController.clear();
                    }
                    return;
                  },
                ),
                
            ],
            )
            ),

      ),
    )
    );
  }

}