import 'package:firebase_demo/fireservice.dart';
import 'package:firebase_demo/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Forgot_withPhone.dart';
import 'sinup_sreen.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

TextEditingController LoginEmail = TextEditingController();
TextEditingController LoginPassword = TextEditingController();

class _Home_screenState extends State<Home_screen> {
  var _passwordVisible = false;

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
              height: 400,
              child: Lottie.asset('assets/animation_lnio51tq.json',
                  fit: BoxFit.cover),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                controller: LoginEmail,
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
                controller: LoginPassword,
                obscureText: _passwordVisible,
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                fireauth.signInUser(LoginEmail.text, LoginPassword.text).then(
                      (value) =>
                          Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return user_screen();
                        },
                      )),
                    );
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 80,
                decoration: BoxDecoration(color: Colors.deepPurple.shade400),
                child: Center(child: Text("Login")),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Forgot_withPhone();
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
                    return Signup_screen();
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Don't have an account SignUp"),
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
