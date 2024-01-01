import 'package:firebase_demo/Forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'fireservice.dart';
import 'home_screen.dart';

class Signup_screen extends StatefulWidget {
  const Signup_screen({Key? key}) : super(key: key);

  @override
  State<Signup_screen> createState() => _Signup_screenState();
}

class _Signup_screenState extends State<Signup_screen> {
  var passwordVisible = false;

  //
  // void initState() {
  //   passwordVisible = false;
  // }

  TextEditingController usernameController = TextEditingController();
  TextEditingController userphoneController = TextEditingController();
  TextEditingController useremailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Firebase"),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              child: Lottie.asset('assets/animation_lnio51tq.json',
                  fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.supervised_user_circle),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: userphoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Phone',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: useremailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                obscureText: passwordVisible,
                controller: userpasswordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: Icon(
                      passwordVisible ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                fireAuth
                    .signUpUser(useremailController.text,
                        userpasswordController.text, userphoneController.text)
                    .then((value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home_screen(),
                    ),
                  );
                  firebaseService.setData(
                    useremailController.text,
                    userpasswordController.text,
                    usernameController.text,
                    userphoneController.text,
                  );
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 80,
                decoration: BoxDecoration(color: Colors.deepPurple.shade400),
                child: Center(child: Text("Sign Up")),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Forgot_password();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Forgot password"),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Home_screen();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Already have an account Login"),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
