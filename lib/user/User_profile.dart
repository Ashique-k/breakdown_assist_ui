import 'package:flutter/material.dart';
class USER_PROFILE extends StatefulWidget {
  const USER_PROFILE({super.key});

  @override
  State<USER_PROFILE> createState() => _USER_PROFILEState();
}

class _USER_PROFILEState extends State<USER_PROFILE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset("assets/images/person.png")),
            Text("Name"),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text("Enter Your Name",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Your name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text("Enter Your Phone ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Phone Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text("Enter Your Email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: ElevatedButton(onPressed: (){}, child: Text("Submit",style: TextStyle(color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
