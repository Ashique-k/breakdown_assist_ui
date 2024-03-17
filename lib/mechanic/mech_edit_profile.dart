import 'package:breakdown_assist/mechanic/Mech_Home.dart';
import 'package:flutter/material.dart';

class Edit_profile extends StatefulWidget {
  const Edit_profile({super.key});

  @override
  State<Edit_profile> createState() => _Edit_profileState();
}

class _Edit_profileState extends State<Edit_profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){


          }, icon: Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset("assets/images/person.png")),
            SizedBox(
              height: 8,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "UserName",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Phone number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Experience",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Location",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Shop name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50 ,
              width: 300,
              child: ElevatedButton(onPressed: (){ Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MECH_HOME()),
              );

              }, child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
