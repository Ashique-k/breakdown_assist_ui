import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mech_accept_reject.dart';

class MECH_REQ extends StatefulWidget {
  const MECH_REQ({Key? key}) : super(key: key);

  @override
  State<MECH_REQ> createState() => _MECH_REQState();
}

class _MECH_REQState extends State<MECH_REQ> {
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
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection("Mechreq")
              .where('mechid', isEqualTo: ID)
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Accept_reject(id: mech[index].id)),
                        );
                      },
                      child: Card(
                        color: Colors.indigo.shade50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                mech[index]['userprofile'] == ''
                                    ? CircleAvatar(
                                  radius: 40,
                                        backgroundImage: ExactAssetImage(
                                            "assets/images/person.png"),
                                      )
                                    : CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage(
                                            mech[index]['userprofile']),
                                      ),
                                Text(
                                  mech[index]['mechusername'],
                                  style: GoogleFonts.acme()
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mech[index]['work'],
                                  style: GoogleFonts.acme(),
                                ),
                                Text(
                                  mech[index]['date'],
                                  style: GoogleFonts.acme(),
                                ),
                                Text(mech[index]['time'],
                                style: GoogleFonts.acme(),),
                                Text(mech[index]['location'],
                                style: GoogleFonts.acme(),),

                                // Padding(
                                //   padding: const EdgeInsets.only(left: 20),
                                //   child: ElevatedButton(onPressed: (){}, child: Text("Payment Sucessfull"),
                                //   style: ElevatedButton.styleFrom(
                                //     backgroundColor: Colors.green
                                //   ),
                                //   ),
                                // ),
                              ],
                            ),
                          ],
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
