import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/user_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,

      // options: DefaultFirebaseOptions.currentPlatform,

      );
  // options:const FirebaseOptions(
  //     apiKe
  //      : "AIzaSyAHD9YzESnX2cWOyAguW8PZwIKZFzlqLEE",
  //     appId: "1:211484198464:android:9543f21b629b8d43dc01a5",
  //     messagingSenderId: "211484198464",
  //     projectId: "fir-ac7e8"),);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
User? user;
class _MyAppState extends State<MyApp>
{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user= FirebaseAuth.instance.currentUser;

  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:Home_screen(),
    );
  }
}
