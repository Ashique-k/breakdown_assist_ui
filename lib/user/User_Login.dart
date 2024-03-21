import 'package:flutter/material.dart';

import 'User_sign_up_page.dart';

class USER_LOGIN extends StatefulWidget {
  const USER_LOGIN({super.key});

  @override
  State<USER_LOGIN> createState() => _USER_LOGINState();
}

class _USER_LOGINState extends State<USER_LOGIN> {
  @override
  Widget build(BuildContext context) {
    final _formkey=GlobalKey<FormState>();
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
              Text("LOGIN",style: TextStyle(fontSize: 15),),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 240),
                child: Text("Enter Username",style: TextStyle(fontWeight: FontWeight.bold),),
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
                    hintText: "Username",
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
                child: Text("Enter Password",style: TextStyle(fontWeight: FontWeight.bold),),
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
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(onPressed: (){}, child: Text("Forgetten Password?")),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(onPressed: (){
            if(_formkey.currentState!.validate()) {
        
            }
        
        
                }, child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
                ),
        
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account"),
                  SizedBox(
                    width: 5,
        
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => USER_SIGNIN()),
                    );



                  }, child: Text("Sign up?",style: TextStyle(color: Colors.orangeAccent),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
