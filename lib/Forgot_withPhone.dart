import 'package:firebase_demo/Forgot_password.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Forgot_withPhone extends StatefulWidget {
  const Forgot_withPhone({Key? key}) : super(key: key);

  @override
  State<Forgot_withPhone> createState() => _Forgot_withPhoneState();
}

TextEditingController Forgotnumber = TextEditingController();

class _Forgot_withPhoneState extends State<Forgot_withPhone> {
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
                controller: Forgotnumber,
                decoration: InputDecoration(
                  hintText: 'PhoneNumber',
                  enabledBorder: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 100,
                decoration: BoxDecoration(color: Colors.deepPurple.shade400),
                child: Center(child: Text("Get OTP")),
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
                      child: Text("Forgot with Email "),
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
