import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Admin_mech extends StatefulWidget {
  const Admin_mech({super.key, required this.id});
  final id;

  @override
  State<Admin_mech> createState() => _Admin_mechState();
}

class _Admin_mechState extends State<Admin_mech> {


  DocumentSnapshot? mech;


  getData() async {
    mech = await FirebaseFirestore.instance
        .collection('mechsignup')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('mechsignup')
          .doc(id)
          .update({'status': 1});
    });
  }

  void rejects(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('mechsignup')
          .doc(id)
          .update({'status': 2});
    });
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Container(
            color: Colors.white54,
            child: Center(
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return Text("Error:${snapshot.error}");
                    }
                    return Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              ExactAssetImage("assets/images/men.png"),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          mech?['username'],
                          style: GoogleFonts.acme()
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "location",
                          style: GoogleFonts.acme(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                // Validation Logic
                                return 'Please enter mechanic username';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: mech?['username'],
                              hintStyle: GoogleFonts.acme(),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                // Validation Logic
                                return 'Please enter ph no:';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "phone number",
                                hintStyle: GoogleFonts.acme(),

                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                // Validation Logic
                                return 'Please enter mail';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "mail",
                                hintStyle: GoogleFonts.acme(),

                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                // Validation Logic
                                return 'Please enter work experience';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: mech?['experience'],
                                hintStyle: GoogleFonts.acme(),

                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                // Validation Logic
                                return 'Please shop name';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: mech?['shop'],
                                hintStyle: GoogleFonts.acme(),

                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                // Validation Logic
                                return 'Please enter your Location';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: "location",
                                hintStyle: GoogleFonts.acme(),

                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                )),
                          ),

                        ),
                        SizedBox(height: 70),
                       mech!['status']==0? Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () {
                                  accept(widget.id);
                                },
                                child: Text("Accept"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 50,
                              width: 250,
                              child: ElevatedButton(
                                onPressed: () {
                                  rejects(widget.id);
                                },
                                child: Text("Reject"),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                              ),
                            ),
                          ]
                        ):mech!['status']==1?
                        SizedBox(
                          height: 20,
                          width: 150,
                          child: ElevatedButton(onPressed: (){}, child: Text("Accepted"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                          ),

                        ):SizedBox(
                          height: 50,
                          width: 200,
                          child: ElevatedButton(onPressed: (){}, child: Text("Rejected"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)
                              ),
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white
                                
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        )
                      ],
                    );
                  }),
            ),
          ),
        ),
      ),
    );
  }
}
