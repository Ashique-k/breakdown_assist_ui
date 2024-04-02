import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
        backgroundColor: Colors.blue.shade200,
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
    future: FirebaseFirestore.instance.collection("Mechreq").where('mechid',isEqualTo: ID).get(),
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
                indent: 13,
                endIndent: 40,
                color: Colors.white,
                thickness: 3,
                height: 30,
              ),
          itemCount:mech.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              color: Colors.blue.shade50,
              height: 150,
              width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Column(
                      children: [
                        Image.asset("assets/images/men.png"),
                      ],
                    ),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              mech[index]['date'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              mech[index]['time'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              mech[index]['location'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),
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
                          Text("Rating"),
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
