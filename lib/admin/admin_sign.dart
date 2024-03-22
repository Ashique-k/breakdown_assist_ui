import 'package:flutter/material.dart';

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
                    height: 150,
                    width: 150,
                    child: Image.asset("assets/images/breakdowncar.jpg")),
                SizedBox(
                  height: 50,
                ),
                Text("LOGIN",style: TextStyle(fontSize: 20,color: Colors.black),),
                SizedBox(
                  height: 20,

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
                      labelText: "Enter name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),

                    ),

                  ),
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
                      labelText: "Enter Password",
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
                    width: 300,

                    child: ElevatedButton(onPressed: (){
                      if(_formkey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(_snackbar);
                        login();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Admin_home()),
                        // );

                      }


                    }, child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.black),),
                      style: ElevatedButton.styleFrom(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.orangeAccent,

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
