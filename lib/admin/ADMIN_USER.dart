import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Admin_User extends StatefulWidget {
  const Admin_User({super.key, required this.id});
  final id;

  @override
  State<Admin_User> createState() => _Admin_UserState();
}

class _Admin_UserState extends State<Admin_User> {
  DocumentSnapshot? user;

  getData() async {
    user = await FirebaseFirestore.instance
        .collection('usersignup')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('usersignup')
          .doc(id)
          .update({'status': 1});
    });
  }

  void rejects(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('usersignup')
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
            color: Colors.white,
            child: Center(
              child: FutureBuilder(
                  future:
                      getData(),
                  builder: (context,snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center (
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (snapshot.hasError) {
                      return
                         Text("Error:${snapshot.error}");

                    }

                    return Column(
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        user?['path']==''?
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage(user!['path']),
                        ):
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage("assets/images/person.png"),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          user?['username'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          user?['location'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 235),
                          child: Text(
                            "Username",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                // Validation Logic
                                return 'required field';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: user?['username'],
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 220),
                          child: Text(
                            "Phone number",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                // Validation Logic
                                return 'required field';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: user?['phone'],
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 275),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                // Validation Logic
                                return 'required field';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: user?['email'],
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                )),
                          ),
                        ),
                        SizedBox(height: 70),
                        user!['status']==0? Row(
                          children: [
                            ElevatedButton(
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
                            SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
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

                          ],

                        ):user!['status']==1?

                            SizedBox(
                                height: 50,
                                width: 200,
                                child: ElevatedButton(onPressed: (){}, child: Text("Accepted"),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1)
                                  ),
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
                        ),
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
