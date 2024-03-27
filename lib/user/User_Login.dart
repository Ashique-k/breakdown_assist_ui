import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'User_home.dart';
import 'User_sign_up_page.dart';

class USER_LOGIN extends StatefulWidget {
  const USER_LOGIN({super.key});

  @override
  State<USER_LOGIN> createState() => _USER_LOGINState();
}

class _USER_LOGINState extends State<USER_LOGIN> {
  var usernamectrl = TextEditingController();
  var passwordctrl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  // final SnackBar _snackBar = SnackBar(content: Text("Sucessfully Registered"),duration: Duration(seconds: 4),);

  String id = '';
  String username = '';
  String location = '';
  String number = '';
  String email = '';
  // String path='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
              ),
              SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset("assets/images/breakdowncar.jpg")),
              Text(
                "LOGIN",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 240),
                child: Text(
                  "Enter Username",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: usernamectrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // Validation Logic
                      return 'Please enter username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 240),
                child: Text(
                  "Enter Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: true,
                  controller: passwordctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      // Validation Logic
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(onPressed: () {}, child: Text("Forgetten Password?")),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      userlogin();

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => USER_HOME()),
                      // );
                    }
                  },
                  child: Text("Login"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account"),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => USER_SIGNIN()),
                        );
                      },
                      child: Text(
                        "Sign up?",
                        style: TextStyle(color: Colors.orangeAccent),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void userlogin() async {
    final users = await FirebaseFirestore.instance
        .collection('usersignup')
        .where('email', isEqualTo: usernamectrl.text)
        .where('password', isEqualTo: passwordctrl.text)
        .where('status', isEqualTo: 1)
        .get();
    if (users.docs.isNotEmpty) {
      id = users.docs[0].id;
      username = users.docs[0]['username'];
      location = users.docs[0]['location'];
      number = users.docs[0]['phone'];
      email = users.docs[0]['email'];
      // path =users.docs[0][''];
      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);
      // data.setString('path', path);
      data.setString('username', username);
      data.setString('location', location);
      data.setString('phone', number);
      data.setString('email', email);
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return USER_HOME();
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("username and password error")));
    }
  }
}
