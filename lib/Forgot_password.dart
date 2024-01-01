import 'package:firebase_demo/fireservice.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Forgot_password extends StatefulWidget {
  const Forgot_password({Key? key}) : super(key: key);

  @override
  State<Forgot_password> createState() => _Forgot_passwordState();
}

TextEditingController Forgotpassword = TextEditingController();

class _Forgot_passwordState extends State<Forgot_password> {
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
                controller: Forgotpassword,
                decoration: InputDecoration(
                  hintText: 'Email',
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                fireAuthforgot.forgotemail(Forgotpassword.text);
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 150,
                decoration: BoxDecoration(color: Colors.deepPurple.shade400),
                child: Center(child: Text("Forgot password")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
