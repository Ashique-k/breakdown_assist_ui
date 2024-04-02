import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'User_payment_sucess.dart';

class USER_MECH_BILL_PAGE extends StatefulWidget {
  const USER_MECH_BILL_PAGE({super.key, required this.id});
  final id;

  @override
  State<USER_MECH_BILL_PAGE> createState() => _USER_MECH_BILL_PAGEState();
}

class _USER_MECH_BILL_PAGEState extends State<USER_MECH_BILL_PAGE> {
  double rating = 0;


  DocumentSnapshot? bill;

  getData() async {
    bill = await FirebaseFirestore.instance
        .collection('Mechreq')
        .doc(widget.id)
        .get();
  }

  void payments(id) {
    print('object');
    FirebaseFirestore.instance.collection('Mechreq').doc(id).update({
      'payment': 5,
      'rating': rating,
    }).then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (context) => User_Payment_sucsess())));
    print('object2');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
          title: Text(
            "Mechanical Bill",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                return Text("Error:${snapshot.error}");
              }

              return SingleChildScrollView(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/images/men.png"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        bill?['mechusername'],
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        bill?['experience'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white),
                          color: Colors.green.shade400,
                        ),
                        child: Text(
                          "Available",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RatingBar.builder(
                        itemSize: 35,
                        minRating: 0.5,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) => setState(() {
                          this.rating = rating;
                        }),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(280, 0, 10, 0),
                            child: Icon(Icons.edit_note),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 220),
                        child: Text(
                          "Amount",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.currency_rupee),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                backgroundColor: Colors.orange.shade200,
                                title: Center(
                                  child: Text("Add Rating"),
                                ),
                                titleTextStyle: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                content: SizedBox(
                                  height: 200,
                                  width: 300,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RatingBar.builder(
                                        itemSize: 40,
                                        minRating: 0.5,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star_border_purple500,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) =>
                                            setState(() {
                                          this.rating = rating;
                                        }),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            payments(widget.id);
                                          },
                                          child: Text("Ok"))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Payment",
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2)),
                              backgroundColor: Colors.green),
                        ),
                      )
                    ])),
              );
            }));
  }
}
