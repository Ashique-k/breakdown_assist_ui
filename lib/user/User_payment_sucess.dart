import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'User_home.dart';

class User_Payment_sucsess extends StatefulWidget {
  const User_Payment_sucsess({super.key});

  @override
  State<User_Payment_sucsess> createState() => _User_Payment_sucsessState();
}

class _User_Payment_sucsessState extends State<User_Payment_sucsess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            Lottie.asset("assets/anmie/payments.json.json"),
            Text(
              "Payment Sucessfully",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => USER_HOME()),
                  );

                },
                child: Text("Back to home"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1)),
                    backgroundColor: Colors.orangeAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
