import 'package:flutter/material.dart';
class USER_NOTIFICATION extends StatefulWidget {
  const USER_NOTIFICATION({super.key});

  @override
  State<USER_NOTIFICATION> createState() => _USER_NOTIFICATIONState();
}

class _USER_NOTIFICATIONState extends State<USER_NOTIFICATION> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title: Text("Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
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
                          Column(
                            children: [
                              Text("Admin Notification"),
                              Text("Admin Notification"),

                            ],
                          ),

                          SizedBox(
                            width: 100,
                          ),

                          Text("Time"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(275, 30, 0, 0),
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

