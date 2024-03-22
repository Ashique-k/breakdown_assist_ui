import 'package:flutter/material.dart';

class mech_status extends StatefulWidget {
  const mech_status({super.key});

  @override
  State<mech_status> createState() => _mech_statusState();
}

class _mech_statusState extends State<mech_status> {
  String ? status;

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
                    color: Colors.orangeAccent,
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
                  child: Text("Add status",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                          value: "Completed",
                          groupValue: status,
                          onChanged: (value){
                            setState(() {
                              status = value;
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
                              groupValue: status,
                              onChanged: (value){
                                setState(() {
                                  status = value;
                                });

                              }
                          ),
                          Text("Not Completed",style: TextStyle(fontSize: 15)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 225, 0),
                  child: Text("Amount",style: TextStyle(fontSize: 20)),
                ),
                SizedBox(
                  height:20 ,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 90
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        prefixIcon: Icon(Icons.currency_rupee)
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      fixedSize: Size(170,30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: (){},
                    child: Text("Submit",style: TextStyle(fontSize: 20),))
              ],
            ),
          ),
        )
    );
  }
}