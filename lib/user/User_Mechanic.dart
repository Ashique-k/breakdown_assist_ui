import 'package:breakdown_assist/user/user_mechanic_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_paginator/number_paginator.dart';

class USER_MECHANIC extends StatefulWidget {
  const USER_MECHANIC({Key? key, required this.selectedLocation})
      : super(key: key);
  final String? selectedLocation;

  @override
  State<USER_MECHANIC> createState() => _USER_MECHANICState();
}

class _USER_MECHANICState extends State<USER_MECHANIC> {
  int currentPage = 0;
  int itemsPerPage = 5;
  late QuerySnapshot? userSnapshot;
  Future<void> getData() async {
    userSnapshot =
        await FirebaseFirestore.instance.collection("mechsignup").get();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 850,
                child: FutureBuilder(
                    future: FirebaseFirestore.instance
                        .collection('mechsignup')
                        .where('status', isEqualTo: 1)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Text('Error${snapshot.error}');
                      }
                      final mech = snapshot.data?.docs ?? [];
                      if (widget.selectedLocation != null) {
                      } else {
                      }
                      final totalItems = mech.length;
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
                                final dataIndex =
                                    (currentPage * itemsPerPage) + index;
                                if (dataIndex >= totalItems) {
                                  return SizedBox(); // Return an empty SizedBox if no more data
                                }

                                final filteredMechanics = mech[dataIndex];

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              User_Mech_Detail(
                                                id: filteredMechanics[index].id,
                                              )),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      color: Colors.indigo.shade50,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              height: 70,
                                              width: 70,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    backgroundImage: AssetImage(
                                                        "assets/images/men.png"),
                                                    radius: 20,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                          mech[index]
                                                              ['username'],
                                                          style: GoogleFonts
                                                              .acme())
                                                    ],
                                                  )
                                                ],
                                              )),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(mech[index]['experience'],
                                                  style: GoogleFonts.acme()),
                                              Text("Fuel leaking",
                                                  style: GoogleFonts.acme()),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20),
                                                child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text("Available"),
                                                  style: ElevatedButton.styleFrom(
                                                      foregroundColor:
                                                          Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2)),
                                                      backgroundColor:
                                                          Colors.green),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ]);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
