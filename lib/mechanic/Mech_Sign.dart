import 'package:breakdown_assist/mechanic/mech_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MECH_SIGN_UP extends StatefulWidget {
  const MECH_SIGN_UP({super.key});

  @override
  State<MECH_SIGN_UP> createState() => _MECH_SIGN_UPState();
}

class _MECH_SIGN_UPState extends State<MECH_SIGN_UP> {
  var usernamectrl=TextEditingController();
  var phonectrl=TextEditingController();
  var emailctrl=TextEditingController();
  var experiencectrl=TextEditingController();
  var shopctrl=TextEditingController();
  var passwordctrl=TextEditingController();
  var locationctrl=TextEditingController();
  Future<dynamic> mechsignup()async{
    await FirebaseFirestore.instance.collection('mechsignup').add({
      "username":usernamectrl.text,
      "phone":phonectrl.text,
      "email":emailctrl.text,
      "experience":experiencectrl.text,
      "shop":shopctrl.text,
      "password":passwordctrl.text,
      "location":locationctrl.text,
      "path":"",
      "status":0
    }).then((value) => {
      print("suceess"),
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MECH_LOGIN()),
      ),

    });
}

  final SnackBar _snackbar = SnackBar(content: Text("succeesfully registerd"),duration: Duration(seconds: 4),);

    final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,

              ),
              SizedBox(
                  height: 200,
                  width: 200,

                  child: Image.asset("assets/images/breakdowncar.jpg")),
              SizedBox(
                height: 20,

              ),
              Text("MECH SIGN UP",style: GoogleFonts.acme(),),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text("enter your username",style: GoogleFonts.acme(),),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: usernamectrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Enter username",
                    hintStyle: GoogleFonts.acme(),
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
                padding: const EdgeInsets.only(right: 180),
                child: Text("enter your phone number",style: GoogleFonts.acme(),),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phonectrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'enter phone number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter phone number",
                      hintStyle: GoogleFonts.acme(),
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
                padding: const EdgeInsets.only(right: 220),
                child: Text("enter your email",style: GoogleFonts.acme(),),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'please enter email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter email",
                      hintStyle: GoogleFonts.acme(),
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
                padding: const EdgeInsets.only(right: 200),
                child: Text("enter your location",style: GoogleFonts.acme(),),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: locationctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'please enter location';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter location",
                      hintStyle: GoogleFonts.acme(),
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
                padding: const EdgeInsets.only(right: 200),
                child: Text("enter your experience",style: GoogleFonts.acme(),),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: experiencectrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'enter experience';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your experience",
                      hintStyle: GoogleFonts.acme(),
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
                padding: const EdgeInsets.only(right: 200),
                child: Text("enter your shop name",style: GoogleFonts.acme(),),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: shopctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'enter shop';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your shop name",
                      hintStyle: GoogleFonts.acme(),
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
                padding: const EdgeInsets.only(right: 200),
                child: Text("enter your password",style: GoogleFonts.acme(),),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter your password",
                      hintStyle: GoogleFonts.acme(),
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
                  width: 250,

                  child: ElevatedButton(onPressed: (){
                    if(_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(_snackbar);

                      mechsignup();

                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MECH_LOGIN()),
                      // );

                    }

                  }, child: Text("Sign in",style:GoogleFonts.abel()),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.indigoAccent.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
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
