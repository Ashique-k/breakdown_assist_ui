
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'admin_add_notification.dart';
class Admin_notification extends StatefulWidget {
  const Admin_notification({super.key});

  @override
  State<Admin_notification> createState() => _Admin_notificationState();
}

class _Admin_notificationState extends State<Admin_notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 5,
        onPressed:(){
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Admin_add_notification()),
          );

        } ,child: Icon(Icons.add),),

      body: SingleChildScrollView(


        child: Center(
          child: Column(
            children: [

              Container(
                height: 900,
                width: 470,
                child: FutureBuilder(
                  future: FirebaseFirestore.instance.collection("notification").get(),
                  builder: (context,AsyncSnapshot<QuerySnapshot>snapshot) {
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
                    final notify = snapshot.data?.docs ?? [];


                    return Card(

                      color: Colors.indigo.shade50,

                      child: ListView.separated(
                          separatorBuilder: (context, index) =>
                              Divider(
                                color: Colors.white,



                                thickness: 3,
                                height: 50,
                              ),
                          itemCount: notify.length,
                          itemBuilder: (BuildContext context, int index) {
                            return
                              ListTile(
                                title: Text(notify[index]["matter"],
                                  style: GoogleFonts.acme()),
                                subtitle: Text(
                                  notify[index]["content"], style: GoogleFonts.aclonica()),
                              );
                          }


                      ),
                    );
                  }

                ),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
