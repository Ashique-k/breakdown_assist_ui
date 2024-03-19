import 'package:flutter/material.dart';

class Mech_Reject_Page extends StatefulWidget {
  const Mech_Reject_Page({super.key});

  @override
  State<Mech_Reject_Page> createState() => _Mech_Reject_PageState();
}

class _Mech_Reject_PageState extends State<Mech_Reject_Page> {
  String ? Status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 150,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue.shade200,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:AssetImage("assets/images/men.png"),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Name",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Fuel Leaking",style: TextStyle(fontSize: 17),),
                          Text("Date",style: TextStyle(fontSize: 17),),
                          Text("Time",style: TextStyle(fontSize: 17),),
                          Text("Place",style: TextStyle(fontSize: 17),),
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                  child: Text("Add status",style: TextStyle(fontSize: 25),),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Radio(
                        value: "Completed",
                        groupValue: Status,
                        onChanged: (value){
                          setState(() {
                            Status = value;
                          });

                        }
                    ),
                    Text("Completed",style: TextStyle(fontSize: 15),),

                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                            value: "Not Completed",
                            groupValue: Status,
                            onChanged: (value){
                              setState(() {
                                Status = value;
                              });

                            }
                        ),
                        Text("Not Completed",style: TextStyle(fontSize: 15)),


                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text("Reject Reason",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(




                  height: 150,
                  width: 250,
                  decoration: BoxDecoration(


                    color: Colors.blueGrey,

                    borderRadius: BorderRadius.circular(10.0),


                  ),

                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(onPressed: (){}, child: Text("Submit",style: TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade200
                  ),

                  ),
                )

              ],
            ),
          ),
        )
    );
  }
}