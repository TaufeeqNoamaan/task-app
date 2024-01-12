import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_text_input.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _title = TextEditingController();
    final auth = FirebaseAuth.instance;
    final userId = auth.currentUser?.uid;
    final db = FirebaseFirestore.instance;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                // * Navigate back to Home
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            CustomTextInput(
                controller: _title,
                icon: Icon(Icons.abc),
                isObscure: false,
                hint: 'Enter task name'),
            ElevatedButton(
                onPressed: () async {
                  // * Create task and navigate to home
                  final docRef =
                      db.collection('App').doc('tasks').collection(userId!);
                  final title = _title.text;
                  final task = {'title': title};
                  await docRef.add(task);
                  Navigator.pop(context);
                },
                child: Text('Create task'))
          ],
        ),
      ),
    );
  }
}
