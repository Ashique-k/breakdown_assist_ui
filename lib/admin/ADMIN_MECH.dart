import 'package:flutter/material.dart';
class Admin_mech extends StatefulWidget {
  const Admin_mech({super.key});

  @override
  State<Admin_mech> createState() => _Admin_mechState();
}

class _Admin_mechState extends State<Admin_mech> {
  final _formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            color: Colors.white54,
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: ExactAssetImage("assets/images/men.png"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Name",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Location",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      validator:  (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter mechanic username';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Mech username",
                        labelText: "Username",

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),

                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter ph no:';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter phone number",
                          labelText: "phone number",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          )
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter mail';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter Email",
                          labelText: "Email",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter work experience';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "experience",
                          labelText: "Work experience",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please shop name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter shop name",
                          labelText: "Work shop name",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'Please enter your Location';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Enter your Location",
                          labelText: "your Location",

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                      height:70
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:100 ),
                    child:  Row(
                      children: [
                        ElevatedButton(onPressed: (){}, child: Text("Accept"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),),
                        SizedBox(
                          width: 5,
                        ),
                        ElevatedButton(onPressed: (){}, child: Text("Reject"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                          ),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )


                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
