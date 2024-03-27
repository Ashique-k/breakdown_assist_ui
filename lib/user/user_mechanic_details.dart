import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class User_Mech_Detail extends StatefulWidget {
  const User_Mech_Detail({super.key,required this.id});
final id;
  @override
  State<User_Mech_Detail> createState() => _User_Mech_DetailState();



}


class _User_Mech_DetailState extends State<User_Mech_Detail> {
  DocumentSnapshot? mech;


  getData() async {

    mech = await FirebaseFirestore.instance
        .collection('mechsignup')
        .doc(widget.id)
        .get();
  }
  int selectedvalue=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("SERVICE",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
            future:  getData(),
    builder: (context,snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center (
          child: CircularProgressIndicator(),
        );
      }

      if (snapshot.hasError) {
        return
          Text("Error:${snapshot.error}");
      }


      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          SizedBox(
              height: 150,
              width: 150,
              child: Image.asset("assets/images/person.png")),
          SizedBox(
            height: 4,

          ),
          Text(mech?['username']),
          SizedBox(
            height: 15,
          ),
          Text(mech?['phone']),
          SizedBox(
            height: 5,

          ),
          Text(mech?['experience']),
          SizedBox(
            height: 4,
          ),
          ElevatedButton(onPressed: () {},
            child: Text("Activate", style: TextStyle(color: Colors.white),),

            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Text("Add Needed Service",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 60,
            width: 260,
            child: DropdownButton(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 98),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_drop_down),
                      IconButton(onPressed: () {}, icon: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(Icons.add_circle),
                      ))
                    ],
                  ),
                ),
                value: selectedvalue,
                items: [
                  DropdownMenuItem(child: Text("fuel leaking"),
                    value: 1,),
                  DropdownMenuItem(child: Text("..."),
                    value: 2,),
                  DropdownMenuItem(child: Text("..."),
                    value: 3,),
                  DropdownMenuItem(child: Text("..."),
                    value: 4,),
                ], onChanged: (int? value) {
              setState(() {
                selectedvalue = value!;
              });
            }),


          ),
          SizedBox(
            height: 20,
          ),
          // SizedBox(
          //   height: 60,
          //   width: 275,
          //   child: DropdownButton(
          //     icon: Padding(
          //       padding: const EdgeInsets.only(left: 200),
          //       child: Icon(Icons.arrow_drop_down),
          //     ),
          //       value: _selectedvalue,
          //       items:[
          //         DropdownMenuItem(child: Text(""),
          //           value: 1,),
          //         DropdownMenuItem(child: Text(""),
          //           value: 2,),
          //         DropdownMenuItem(child: Text(""),
          //           value: 3,),
          //         DropdownMenuItem(child: Text(""),
          //           value: 4,),
          //       ], onChanged: (int? value){
          //     setState(() {
          //       _selectedvalue=value!;
          //     });
          //   }),
          //
          // ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Text("Place"),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            width: 300,

            child: TextField(
              decoration: InputDecoration(
                  hintText: 'location',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),


            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(onPressed: () {},
              child: Text("Submit", style: TextStyle(color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange
              ),

            ),
          )

        ],
      );
    }
          ),
        ),
      ),
    );
  }
}
