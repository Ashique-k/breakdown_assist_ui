import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MECH_FAILED extends StatefulWidget {
  const MECH_FAILED({super.key});

  @override
  State<MECH_FAILED> createState() => _MECH_FAILEDState();
}

class _MECH_FAILEDState extends State<MECH_FAILED> {
  double rating = 0;
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
        body: SingleChildScrollView(
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
                "Name",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "+2 Year Experience",
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
             Column(children: [
               Padding(
                 padding: const EdgeInsets.only(right: 225),
                 child: Text(
                   "Failed Reason",
                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                   onPressed: () {},
                   child: Text("Ok"),
                   style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(1)),
                       backgroundColor: Colors.orangeAccent),
                 ),
               )
             ],)
            ]))));
  }
}
