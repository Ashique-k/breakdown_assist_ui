import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mech_Status.dart';

class Mechanic_accept extends StatefulWidget {
  const Mechanic_accept({Key? key}) : super(key: key);

  @override
  State<Mechanic_accept> createState() => _Mechanic_acceptState();
}

class _Mechanic_acceptState extends State<Mechanic_accept> {
  int currentPage = 0;
  int itemsPerPage = 2;
  late QuerySnapshot? userSnapshot;
  Future<void> get() async {
    userSnapshot =
    await FirebaseFirestore.instance.collection("usersignup").get();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  var ID = '';

  Future<void> getdata() async {
    final prefs = await SharedPreferences.getInstance();
    ID = prefs.getString('id')!;

    setState(() {
      // print("get it");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("Mechreq")
              .where('status', isEqualTo: 1)
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
            final detail = snapshot.data?.docs ?? [];
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

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: InkWell(
                        onTap: () {
                          detail[index]['payment'] == 0
                              ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => mech_status(
                                    id: detail[index].id,
                                  )))
                              : null;
                        },
                        child: Card(
                          color: Colors.indigo.shade50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  detail[index]['userprofile'] == ''
                                      ? CircleAvatar(
                                      radius: 35,
                                      backgroundImage: AssetImage(
                                          "Assets/profile img.png"))
                                      : CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        detail[index]['userprofile']),
                                    radius: 35,
                                  ),
                                  Text(detail[index]["username"],
                                      style: GoogleFonts.acme()),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    detail[index]['work'],
                                    style: GoogleFonts.acme(),
                                  ),
                                  Text(detail[index]['date'],
                                      style: GoogleFonts.acme()),
                                  Text(detail[index]['time'],
                                      style: GoogleFonts.acme()),
                                  Text(detail[index]['location'],
                                      style: GoogleFonts.acme()),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  detail[index]['payment'] == 0
                                      ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.orange),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: Colors.orange),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "Work in progress",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                      : detail[index]['payment'] == 3
                                      ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: Colors.red),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(2.0),
                                      child: Text(
                                        "Payment pending",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                      : detail[index]['payment'] == 4
                                      ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red),
                                        borderRadius:
                                        BorderRadius.circular(
                                            10),
                                        color: Colors.red),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(2.0),
                                      child: Text(
                                        "Failed",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                      : detail[index]['payment'] == 5
                                      ? Container(
                                    height: 25,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                            Colors.green),
                                        borderRadius:
                                        BorderRadius
                                            .circular(10),
                                        color: Colors.green),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(
                                          2.0),
                                      child: Center(
                                        child: Text(
                                          "Payment successful",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                      : detail[index]['payment'] == 6
                                      ? Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors
                                                .grey
                                                .shade400),
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            10),
                                        color: Colors
                                            .grey.shade400),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets
                                          .all(2.0),
                                      child: Text(
                                        "Completed",
                                        style: TextStyle(
                                          color:
                                          Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  )
                                      : Text(''),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
             )
                ]
            );
          }),
    );
  }
}
