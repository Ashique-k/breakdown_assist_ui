import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_paginator/number_paginator.dart';

import 'ADMIN_MECH.dart';

class Admin_home_mechanic extends StatefulWidget {
  const Admin_home_mechanic({Key? key}) : super(key: key);

  @override
  State<Admin_home_mechanic> createState() => _Admin_home_mechanicState();
}

class _Admin_home_mechanicState extends State<Admin_home_mechanic> {
  int currentPage = 0;
  int itemsPerPage = 2;
  late QuerySnapshot? userSnapshot;
  Future<void> get() async {
    userSnapshot =
        await FirebaseFirestore.instance.collection("mechsignup").get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("mechsignup").get(),
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
            final user = snapshot.data?.docs ?? [];
            final totalItems = user.length;
            final totalPages = (totalItems / itemsPerPage).ceil();
            return Column(children: [
              NumberPaginator(
                numberPages: totalPages,
                initialPage: currentPage,
                onPageChange: (int newPage) {
                  setState(() {
                    currentPage = newPage;
                  });
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: (currentPage == totalPages - 1)
                        ? totalItems - (currentPage * itemsPerPage)
                        : itemsPerPage,
                    itemBuilder: (context, index) {
                      final dataIndex = (currentPage * itemsPerPage) + index;
                      if (dataIndex >= totalItems) {
                        return SizedBox(); // Return an empty SizedBox if no more data
                      }

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
                              mech[index]['path'] == ''
                                  ? CircleAvatar(
                                      radius: 40,
                                      backgroundImage: ExactAssetImage(
                                          "assets/images/person.png"),
                                    )
                                  : CircleAvatar(
                                      radius: 40,
                                      backgroundImage:
                                          NetworkImage(mech[index]['path']),
                                    ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    mech[index]["username"],
                                    style: GoogleFonts.acme(),
                                  ),
                                  Text(
                                    mech[index]["phone"],
                                    style: GoogleFonts.acme(),
                                  ),
                                  Text(
                                    mech[index]["experience"],
                                    style: GoogleFonts.acme(),
                                  ),
                                ],
                              ),
                              mech[index]['status'] == 0
                                  ? Padding(
                                      padding: const EdgeInsets.only(left: 35),
                                      child: Center(
                                        child: Container(
                                          height: 40,
                                          width: 100,
                                          child: Text(
                                            "Pending",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  : mech[index]['status'] == 1
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(left: 60),
                                          child: Container(
                                            height: 40,
                                            width: 80,
                                            color: Colors.green,
                                            child: Center(
                                                child: Text(
                                              "Accept",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        )
                                      : Padding(
                                          padding:
                                              const EdgeInsets.only(left: 40),
                                          child: Container(
                                            height: 40,
                                            width: 80,
                                            color: Colors.red,
                                            child: Center(
                                                child: Text(
                                              "Reject",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                        )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ]);
          }),
    );
  }
}
