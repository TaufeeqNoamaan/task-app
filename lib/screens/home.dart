import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final userId = auth.currentUser?.uid;
    final db = FirebaseFirestore.instance;
    final docRef = db.collection('App').doc('tasks').collection(userId!);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Home Page'),
            centerTitle: true,
          ),
          floatingActionButton: ElevatedButton(
              onPressed: () {
                // * Navigate to create task screen
                Navigator.pushNamed(context, '/createTask');
              },
              child: Icon(Icons.add)),
          body: StreamBuilder(
              stream: docRef.snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // * Show data
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot docSnap =
                            snapshot.data!.docs[index];
                        return Slidable(
                            endActionPane:
                                ActionPane(motion: ScrollMotion(), children: [
                              SlidableAction(
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                  onPressed: (context) async {
                                    final docId = docSnap.id;
                                    await docRef.doc(docId).delete();
                                  })
                            ]),
                            child: Card(
                              color: Colors.purpleAccent,
                              child: ListTile(
                                title: Center(child: Text(docSnap['title'])),
                              ),
                            ));
                      });
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
