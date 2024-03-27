import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ADMIN_MECH.dart';

class Admin_home_mechanic extends StatefulWidget {
  const Admin_home_mechanic({super.key});

  @override
  State<Admin_home_mechanic> createState() => _Admin_home_mechanicState();
}

class _Admin_home_mechanicState extends State<Admin_home_mechanic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 900,
                width: 470,
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection("mechsignup")
                        .get(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error:${snapshot.error}"),
                        );
                      }
                      final mech = snapshot.data?.docs ?? [];

                      return ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                                indent: 13,
                                endIndent: 60,
                                color: Colors.white,
                                thickness: 20,
                                height: 50,
                              ),
                          itemCount: mech.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Admin_mech(id: mech[index].id);
                                }));
                              },
                              child: Container(
                                height: 100,
                                width: 200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: Image.asset(
                                            "assets/images/men.png")),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mech[index]["username"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(mech[index]["phone"]),
                                        Text(mech[index]["experience"]),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
