import 'package:flutter/material.dart';
class Nofification_Mech extends StatefulWidget {
  const Nofification_Mech({super.key});

  @override
  State<Nofification_Mech> createState() => _Nofification_MechState();
}

class _Nofification_MechState extends State<Nofification_Mech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title: Text("Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
          centerTitle: true,
        ),
        body: ListView.separated(
            separatorBuilder: (context,index)=> Divider(thickness: 5,color: Colors.white,),
            itemCount: 2,
            itemBuilder: (BuildContext context,int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20
                ),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all()
                  ),
                  height: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Admin Notification"),
                          SizedBox(
                            width: 100,
                          ),
                          Text("Time"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(275, 50, 0, 0),
                        child: Text("Date"),
                      ),
                    ],
                  ),
                ),
              );
            }
        )
    );
  }
}
