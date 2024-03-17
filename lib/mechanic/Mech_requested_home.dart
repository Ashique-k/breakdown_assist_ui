import 'package:flutter/material.dart';
class Mechanic_request extends StatefulWidget {
  const Mechanic_request({super.key});

  @override
  State<Mechanic_request> createState() => _Mechanic_requestState();
}

class _Mechanic_requestState extends State<Mechanic_request> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     Icon(Icons.notification_add),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

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
                    itemCount: 3,
                    itemBuilder: (BuildContext context,int index){
                      return
                        Container(
                          height: 100,
                          width: 200,
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,


                            children: [
                              SizedBox(
                                  height:20,
                                  width: 50,
                                  child: Column(
                                    children: [
                                      Image.asset("assets/images/men.png"),
                                      Text("name"),
                                    ],
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Complaint",style: TextStyle(fontWeight: FontWeight.bold),),

                                  Text("Date"),
                                  Text("Time"),
                                  Text("Place"),
                                ],
                              )
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
