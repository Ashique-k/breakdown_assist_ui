import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_paginator/number_paginator.dart';

import 'ADMIN_USER.dart';

class Admin_home_user extends StatefulWidget {
  const Admin_home_user({Key? key}) : super(key: key);

  @override
  State<Admin_home_user> createState() => _Admin_home_userState();
}

class _Admin_home_userState extends State<Admin_home_user> {
  int currentPage = 0;
  int itemsPerPage = 2;
  late QuerySnapshot? userSnapshot;
  Future<void> getData() async {
    userSnapshot =
        await FirebaseFirestore.instance.collection("usersignup").get();
  }

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
                        .collection("usersignup")
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
                      final user = snapshot.data?.docs ?? [];
                      final totalItems = user.length;
                      final totalPages = (totalItems / itemsPerPage).ceil();
                      return Column(
                        children: [
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
                                  final dataIndex =
                                      (currentPage * itemsPerPage) + index;
                                  if (dataIndex >= totalItems) {
                                    return SizedBox(); // Return an empty SizedBox if no more data
                                  }

                                  final userData = user[dataIndex];

                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Admin_User(id: userData.id),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      color: Colors.indigo.shade50,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: ExactAssetImage(
                                                  "assets/images/men.png"),
                                              radius: 30,
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
                                                Text(user[index]["username"],
                                                    style: GoogleFonts.acme()),
                                                Text(
                                                  user[index]["location"],
                                                  style: GoogleFonts.acme(),
                                                ),
                                                Text(
                                                  user[index]["phone"],
                                                  style: GoogleFonts.acme(),
                                                ),
                                                Text(
                                                  user[index]["email"],
                                                  style: GoogleFonts.acme(),
                                                ),
                                              ],
                                            ),
                                            user[index]['status'] == 0
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 35),
                                                    child: Container(
                                                      height: 40,
                                                      width: 80,
                                                      color: Colors.blueAccent,
                                                      child: Center(
                                                        child: Text(
                                                          "Pending",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : user[index]['status'] == 1
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 40),
                                                        child: Container(
                                                          height: 40,
                                                          width: 80,
                                                          color: Colors.green,
                                                          child: Center(
                                                              child: Text(
                                                            "Accept",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ),
                                                      )
                                                    : Container(
                                                        height: 40,
                                                        width: 80,
                                                        color: Colors.red,
                                                        child: Center(
                                                            child: Text(
                                                          "Reject",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      )
                                          ]),
                                    ),
                                  );
                                }),
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
