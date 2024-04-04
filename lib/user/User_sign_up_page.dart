import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'User_Login.dart';

class USER_SIGNIN extends StatefulWidget {
  const USER_SIGNIN({super.key});

  @override
  State<USER_SIGNIN> createState() => _USER_SIGNINState();
}

class _USER_SIGNINState extends State<USER_SIGNIN> {
  var usernamectrl=TextEditingController();
  var locationctrl=TextEditingController();
  var phonectrl=TextEditingController();
  var emailctrl=TextEditingController();
  var passwordctrl=TextEditingController();

  final _formkey=GlobalKey<FormState>();
  final SnackBar _snackbar = SnackBar(content: Text("succeesfully registerd"),duration: Duration(seconds: 4),);

  Future<dynamic> usersignup()async{
   await FirebaseFirestore.instance.collection('usersignup').add({
     "username":usernamectrl.text,
     "location":locationctrl.text,
     "phone":phonectrl.text,
     "email":emailctrl.text,
     "password":passwordctrl.text,
     "path":"",
     "status":0
   }).then((value) => {
     print("suceess"),
   Navigator.push(
   context,
   MaterialPageRoute(builder: (context) => USER_LOGIN()),
   ),

   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            SizedBox(
            height: 50,
        
          ),
          SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                  fit: BoxFit.fill,
                  "assets/images/breakdowncar.jpg")),
          Text(" USER SIGN UP",style:GoogleFonts.acme()),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 240),
            child: Text("Enter Username",style:GoogleFonts.acme()),
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
                hintText: "Username",
                hintStyle: GoogleFonts.acme(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
        
          ),
              Padding(
                padding: const EdgeInsets.only(right: 240),
                child: Text("Enter Location",style: GoogleFonts.acme()),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: locationctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return ' enter location';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "location",
                    hintStyle: GoogleFonts.acme(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,

              ),
          Padding(
            padding: const EdgeInsets.only(right: 180),
            child: Text("Enter Your Phone number",style: GoogleFonts.acme()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: phonectrl,
              validator: (value) {
                if (value == null || value.isEmpty) {   // Validation Logic
                  return 'Please enter phone number';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Phone number",
                hintStyle: GoogleFonts.acme(),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
            ),
          ),
              Padding(
                padding: const EdgeInsets.only(right: 240),
                child: Text("Enter Your Email",style: GoogleFonts.acme()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: GoogleFonts.acme(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
        
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text("Enter your Password",style: GoogleFonts.acme()),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordctrl,
                  validator: (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: GoogleFonts.acme(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
        
              ),
              SizedBox(
                height: 50,
                width: 250,
                child: ElevatedButton(onPressed: (){
              if(_formkey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                usersignup();
        
              }
        
        
                }, child: Text("SIGN UP",style: GoogleFonts.abel()),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.indigoAccent.shade100
                ),
                ),
              )
        
          ]
              ),
        ),
      )

    );
  }
}
