import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/home_screen.dart';
import 'package:flutter/material.dart';

class user_screen extends StatefulWidget {
  const user_screen({Key? key}) : super(key: key);

  @override
  State<user_screen> createState() => _user_screenState();
}

class _user_screenState extends State<user_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Firebase")),
          backgroundColor: Colors.deepPurple,
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return Home_screen();
                    },
                  ));
                },
                icon: Icon(Icons.logout))
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.deepPurple,
          ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                      ),
                      child: Text("data"),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                    ),
                    child: Text("data"),
                  ),
                ))
              ],
            )
          ],
        ));
  }
}
