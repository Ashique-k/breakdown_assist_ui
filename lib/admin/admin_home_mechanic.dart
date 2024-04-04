import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: FutureBuilder(
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

                      color: Colors.white,
                      thickness: 5,
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
                    child: Card(
                     color: Colors.indigo.shade50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: ExactAssetImage("assets/images/men.png"),
                            radius: 31,
                          ),
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
                                style: GoogleFonts.acme()
                                    ,
                              ),
                              Text(mech[index]["phone"],style: GoogleFonts.acme(),),
                              Text(mech[index]["experience"],style: GoogleFonts.acme(),),
                            ],
                          ),
                          mech [index]['status']==0? Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: Center(
                              child: Container(
                                height: 40,
                                width: 100,
                                child: Text("Pending",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.white),
                                                                            ),
                              ),
                            ),
                          ):mech[index]['status']==1?
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Container(
                              height: 40,
                              width: 100,
                              color: Colors.green,
                              child: Center(child: Text("Accept",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),)),
                            ),
                          ):Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Container(
                              height: 40,
                              width: 100,
                              color: Colors.red,
                              child: Center(child: Text("Reject",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),)),
                            ),
                          )

                        ],
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
