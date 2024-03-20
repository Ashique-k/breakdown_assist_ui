import 'package:flutter/material.dart';

class USER_SIGNIN extends StatefulWidget {
  const USER_SIGNIN({super.key});

  @override
  State<USER_SIGNIN> createState() => _USER_SIGNINState();
}

class _USER_SIGNINState extends State<USER_SIGNIN> {
  final _formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
        Text("SIGN UP",style: TextStyle(fontSize: 15),),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 240),
          child: Text("Enter Username",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
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
          padding: const EdgeInsets.only(right: 200),
          child: Text("Enter Your Phone number",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {   // Validation Logic
                return 'Please enter phone number';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Phone number",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8)
              ),
            ),
          ),
        ),
            Padding(
              padding: const EdgeInsets.only(right: 240),
              child: Text("Enter Your Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {   // Validation Logic
                    return 'Please enter Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
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
              child: Text("Enter your Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
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
              height: 15,

            ),
            SizedBox(
              height: 50,
              width: 250,
              child: ElevatedButton(onPressed: (){
            if(_formkey.currentState!.validate()) {

            }


              }, child: Text("SIGN UP",style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent
              ),
              ),
            )

        ]
            ),
      )

    );
  }
}
