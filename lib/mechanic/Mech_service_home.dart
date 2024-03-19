import 'package:flutter/material.dart';
class MECH_SERVICE_HOME extends StatefulWidget {
  const MECH_SERVICE_HOME({super.key});

  @override
  State<MECH_SERVICE_HOME> createState() => _MECH_SERVICE_HOMEState();
}

class _MECH_SERVICE_HOMEState extends State<MECH_SERVICE_HOME> {
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage("assets/images/men.png"),
                                        radius: 20,
                                      ),
                                      Text("Name",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),)
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
                                  Text("Date",),
                                  Text("Time"),
                                  Text("Place"),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(left: 20),
                                  //   child: ElevatedButton(onPressed: (){}, child: Text("Payment Sucessfull"),
                                  //   style: ElevatedButton.styleFrom(
                                  //     backgroundColor: Colors.green
                                  //   ),
                                  //   ),
                                  // ),
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
