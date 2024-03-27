import 'package:breakdown_assist/mechanic/Mech_Home.dart';
import 'package:breakdown_assist/mechanic/Mech_Sign.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MECH_LOGIN extends StatefulWidget {
  const MECH_LOGIN({super.key});

  @override
  State<MECH_LOGIN> createState() => _MECH_LOGINState();
}

class _MECH_LOGINState extends State<MECH_LOGIN> {
  var usernamectrl = TextEditingController();
  var passwordctrl = TextEditingController();
  String id = '';
  String username = '';
  String number = '';
  String  email= '';
  String experience = '';
  String shop = '';
  String password = '';



  final _formkey=GlobalKey<FormState>();
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
                    controller: usernamectrl,
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
                    controller: passwordctrl,
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
                Padding(
                  padding: const EdgeInsets.only(left: 150),
                  child: TextButton(onPressed: (){}, child: Text("Forgotten Password?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),)),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 300,

                  child: ElevatedButton(onPressed: (){
                    if(_formkey.currentState!.validate()) {
                      mechlogin();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => MECH_HOME()),
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't haven't account"),
                    SizedBox(
                      width: 2,
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MECH_SIGN_UP()),
                      );




                    }, child: Text("Sign Up ?"))
                  ],
                ),




              ],
            ),
          ),
        ),
      ),

    );
  }
  void mechlogin()async{
    final mech= await FirebaseFirestore.instance.collection('mechsignup').where('email',isEqualTo: usernamectrl.text)
        .where('password',isEqualTo: passwordctrl.text)
        .where('status',isEqualTo: 0)
        .get();
    if (mech.docs.isNotEmpty){
      id = mech.docs[0].id;
      username = mech.docs[0]['username'];
      number =mech.docs[0]['phone'];
      email =mech.docs[0]['email'];
      experience =mech.docs[0]['experience'];
      shop =mech.docs[0]['shop'];
      password =mech.docs[0]['password'];

      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);
      data.setString('username', username);
      data.setString('phone', number);
      data.setString('email', email);
      data.setString('experience', experience);
      data.setString('shop', shop);
      data.setString('password', password);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return MECH_HOME();
        },
      ));




    } else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("username and password error")));
    }
  }
}

