import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class USER_MECH_BILL_PAGE extends StatefulWidget {
  const USER_MECH_BILL_PAGE({super.key});

  @override
  State<USER_MECH_BILL_PAGE> createState() => _USER_MECH_BILL_PAGEState();
}

class _USER_MECH_BILL_PAGEState extends State<USER_MECH_BILL_PAGE> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
        title: Text("Mechanical Bill",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
      Text("Name",style: TextStyle(fontSize: 25),),
      SizedBox(
      height: 10,
      ),
      Text("+2 Year Experience",style: TextStyle(fontSize: 20),),
      SizedBox(
      height: 10,
      ),
      Container(
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white),
      color: Colors.green.shade400,
      ),
      child: Text("Available",style: TextStyle(color: Colors.white,fontSize: 20),),
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
      }
      ),
      ),
      Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(280,0,  10, 0),
            child: Icon(Icons.edit_note),
          )
        ],
      ),
      SizedBox(
      height: 50,
      ),
        Padding(
          padding: const EdgeInsets.only(right: 220),
          child: Text("Amount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
        ),
        SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50),
          child: SizedBox(
            height: 40,
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.currency_rupee),
                hintText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 50,
          width: 300,
          child: ElevatedButton(onPressed: (){}, child: Text("Payment",style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green
          ),
          ),
        )
      
      
          ]
      )
      
      ),
    )
    );
  }
}
