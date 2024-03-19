import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class MECH_RATING extends StatefulWidget {
  const MECH_RATING({super.key});

  @override
  State<MECH_RATING> createState() => _MECH_RATINGState();
}

class _MECH_RATINGState extends State<MECH_RATING> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,

        title: Text("Rating",style: TextStyle(fontWeight: FontWeight.bold),),
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
    width: 470,
    child: ListView.separated(
    separatorBuilder: (context,index)=>Divider(
    indent: 13,
    endIndent: 60,
    color:Colors.white ,
    thickness: 20,
    height: 50,
    ),
    itemCount: 10,
    itemBuilder: (BuildContext context,int index){
    return
    Container(
    color: Colors.blue.shade50,

    height: 130,
    width: 180,


    child: Row(

    mainAxisAlignment: MainAxisAlignment.start,
    // crossAxisAlignment: CrossAxisAlignment.center,


    children: [
    SizedBox(
    height:50,
    width: 50,
    child:

    Column(
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
    SizedBox(height: 20,),
    Text("engine work",style: TextStyle(fontWeight: FontWeight.bold),),
    Text("Date",style: TextStyle(fontWeight: FontWeight.bold),),
    Text("Time",style: TextStyle(fontWeight: FontWeight.bold),),
    Text("Place",style: TextStyle(fontWeight: FontWeight.bold),),
    ],
    ),
    ),
    SizedBox(
    width: 40,
    ),
    Column(
    children: [
    Text("Rating"),
    SizedBox(

    child: RatingBar.builder(
    itemSize:16 ,
    initialRating: 3,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => Icon(
    Icons.star,
    color: Colors.amber,
    ),
    onRatingUpdate: (rating) {
    print(rating);
    },
    ),
    ),

    ],
    ),

    ],
    ),
      SizedBox(
        width: 25,
      ),


    ],

    ),

    );
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
