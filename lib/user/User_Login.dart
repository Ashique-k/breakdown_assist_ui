import 'package:flutter/material.dart';

class USER_LOGIN extends StatefulWidget {
  const USER_LOGIN({super.key});

  @override
  State<USER_LOGIN> createState() => _USER_LOGINState();
}

class _USER_LOGINState extends State<USER_LOGIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            child: TextField(
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
            child: TextField(
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
              TextButton(onPressed: (){}, child: Text("Sign up?",style: TextStyle(color: Colors.orangeAccent),))
            ],
          )
        ],
      ),
    );
  }
}
