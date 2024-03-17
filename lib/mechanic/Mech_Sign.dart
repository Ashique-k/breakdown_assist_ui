import 'package:breakdown_assist/mechanic/mech_login.dart';
import 'package:flutter/material.dart';

class MECH_SIGN extends StatefulWidget {
  const MECH_SIGN({super.key});

  @override
  State<MECH_SIGN> createState() => _MECH_SIGNState();
}

class _MECH_SIGNState extends State<MECH_SIGN> {
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,

              ),
              SizedBox(
                  height: 150,
                  width: 150,

                  child: Image.asset("assets/images/breakdowncar.jpg")),
              SizedBox(
                height: 20,

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter Username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                    )

                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'enter phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Phone number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )

                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'please enter mail';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )

                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'required field';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your experience",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )

                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'required field';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your shop name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )

                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )

                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                 height: 50,
                  width: 300,

                  child: ElevatedButton(onPressed: (){
                    if(_formkey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MECH_LOGIN()),
                      );

                    }

                  }, child: Text("Sign in"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),

                  ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
