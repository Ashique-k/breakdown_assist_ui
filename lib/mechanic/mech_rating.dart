import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MECH_RATING extends StatefulWidget {
  const MECH_RATING({super.key});

  @override
  State<MECH_RATING> createState() => _MECH_RATINGState();
}

class _MECH_RATINGState extends State<MECH_RATING> {

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
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade100,
        title: Text(
          "Rating",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text("The rating given to you"),
              Container(
                height: 900,
                width: 450,
                child: FutureBuilder(
    future: FirebaseFirestore.instance.collection("Mechreq").where('mechid',isEqualTo: ID).where('final',isEqualTo: 1).get(),
    builder: (context,AsyncSnapshot<QuerySnapshot>snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(

          ),
        );
      }
      if (snapshot.hasError) {
        return Center(
          child: Text("Error:${snapshot.error}"),
        );
      }
      final mech = snapshot.data?.docs ?? [];

      return ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(


                height: 6,
              ),
          itemCount:mech.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.indigo.shade50,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Column(
                    children: [
                      CircleAvatar(


                        backgroundImage: ExactAssetImage("assets/images/men.png"),
                        radius: 35,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              mech[index]['work'],
                              style: GoogleFonts.acme(),
                            ),
                            Text(
                              mech[index]['date'],
                              style: GoogleFonts.acme(),
                            ),
                            Text(
                              mech[index]['time'],
                              style: GoogleFonts.acme(),
                            ),
                            Text(
                              mech[index]['location'],
                              style: GoogleFonts.acme(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text("Rating",style: GoogleFonts.acme(),),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 40),
                              child: RatingBar.builder(
                                itemSize: 20,
                                initialRating: mech[index]['rating'],
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.symmetric(horizontal: 5.0),
                                itemBuilder: (context, _) =>
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                ],
              ),
            );
          });
    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
