import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'User_home.dart';

class MECH_FAILED extends StatefulWidget {
  const MECH_FAILED({super.key,required this.id});
final id;
  @override
  State<MECH_FAILED> createState() => _MECH_FAILEDState();
}

class _MECH_FAILEDState extends State<MECH_FAILED> {
  DocumentSnapshot? reject;

  getData() async {
    reject = await FirebaseFirestore.instance
        .collection('Mechreq')
        .doc(widget.id)
        .get();
  }
  double rating = 0;
  void failed(id) {
    print('object');
    FirebaseFirestore.instance.collection('Mechreq').doc(id).update({
      'payment': 6,
      'rating': rating,
    }).then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (context) => USER_HOME())));
    print('object2');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          centerTitle: true,
          title: Text(
            "Failed Project",
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
                      reject?['mechusername'],
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      reject?['experience'],
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
                      itemBuilder: (context, _) =>
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                      onRatingUpdate: (rating) =>
                          setState(() {
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
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 225),
                        child: Text(
                          "Failed Reason",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 80, left: 40, bottom: 20, top: 10),
                        child: TextField(

                          decoration: InputDecoration(
                            hintText: reject?['paymentreject'],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
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
                              ElevatedButton(onPressed: (){

                                failed(widget.id);
                              }, child: Text("Submit"))
                              ]
                            )
                            ),
                                ),

                            );


                          },
                          child: Text("Ok"),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(1)),
                              backgroundColor: Colors.orangeAccent),
                        ),
                      )
                    ],)
                  ]))
      );
    }
        ));
  }
}
