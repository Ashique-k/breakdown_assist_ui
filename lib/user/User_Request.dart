import 'package:flutter/material.dart';

class USER_REQUEST extends StatefulWidget {
  const USER_REQUEST({super.key});

  @override
  State<USER_REQUEST> createState() => _USER_REQUESTState();
}

class _USER_REQUESTState extends State<USER_REQUEST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              Container(
                height: 850,
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
                                  height:70,
                                  width: 70,
                                  child: Column(
                                    children: [
                                      // CircleAvatar(
                                      //   backgroundImage: AssetImage("assets/images/men.png"),
                                      //
                                      //
                                      // ),
                                      // Text("name"),
                                    ],
                                  )),
                              // SizedBox(
                              //   width: 20,
                              // ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),

                                  Text("Date"),
                                  Row(
                                    children: [
                                      Text("Complaint"),
                                      SizedBox(
                                        width: 30,
                                      ),

                                      Container(
                                        alignment: Alignment.bottomCenter,


                                        height: 27,
                                        width: 150,

                                        color: Colors.green,
                                        child: Center(child: Text("payment sucess")),
                                      )
                                    ],
                                  ),
                                  // Text("Place"),
                                  // Container(
                                  //   alignment: Alignment.centerRight,
                                  //
                                  //   height: 27,
                                  //   width: 150,
                                  //
                                  //   color: Colors.green,
                                  //   child: Center(child: Text("payment sucess")),
                                  // )
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


