import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Logged in as : ${user.email}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("users")
                    .doc(user.uid)
                    .update({"something": "something"});
              },
              child: const Text("Add something to firestore"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(user.uid)
                      .delete();
                },
                child: const Text("remove user data")),
          ],
        ),
      ),
    );
  }
}
