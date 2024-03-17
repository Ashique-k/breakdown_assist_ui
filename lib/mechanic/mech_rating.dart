import 'package:flutter/material.dart';
class Rating_Mech extends StatefulWidget {
  const Rating_Mech({super.key});

  @override
  State<Rating_Mech> createState() => _Rating_MechState();
}

class _Rating_MechState extends State<Rating_Mech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rating"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 150,
              child: Image.asset("assets/images/person.png")),
          Text("Name"),


        ],
      ),

    );
  }
}
