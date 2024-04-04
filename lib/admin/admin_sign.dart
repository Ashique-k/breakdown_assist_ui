import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'admin_home.dart';
class ADMIN_SIGN extends StatefulWidget {
  const ADMIN_SIGN({super.key});

  @override
  State<ADMIN_SIGN> createState() => _ADMIN_SIGNState();
}

class _ADMIN_SIGNState extends State<ADMIN_SIGN> {
  var username=TextEditingController();
  var password=TextEditingController();
final _formkey=GlobalKey<FormState>();
  final SnackBar _snackbar = SnackBar(content: Text("logging in"),duration: Duration(seconds: 4),);

login(){
  if (username.text == 'ashikmessi3@gmail.com' && password.text == '123456'){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Admin_home()),
    );

  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: 250,
                    width: 250,
                    child: Image.asset(
                        fit: BoxFit.fill,
                        "assets/images/breakdowncar.jpg")),
                SizedBox(
                  height: 50,
                ),
                Text("ADMIN LOGIN",style: GoogleFonts.acme(),),
                SizedBox(
                  height: 20,

                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220),
                  child: Text("enter your name",style: GoogleFonts.acme(),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'Please enter username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText:"Enter Username",
                     hintStyle: GoogleFonts.acme(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),

                    ),

                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 210),
                  child: Text("enter your password",style: GoogleFonts.acme(),),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: true,
                    controller: password,
                    validator: (value) {
                      if (value == null || value.isEmpty) {   // Validation Logic
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText:"Enter Your Password",
                     hintStyle: GoogleFonts.acme(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),

                    ),

                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 50,
                    width: 250,

                    child: ElevatedButton(onPressed: (){
                      if(_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                        login();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Admin_home()),
                        // );

                      }


                    }, child: Text("Login",style: GoogleFonts.abel()),
                      style: ElevatedButton.styleFrom(


                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.indigoAccent.shade100,

                      ),
                    ),
                )




              ],
            ),
          ),
        ),
      ),

    );
  }
}
