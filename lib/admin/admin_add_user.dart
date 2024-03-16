import 'package:flutter/material.dart';
class Admin_home_user extends StatefulWidget {
  const Admin_home_user({super.key});

  @override
  State<Admin_home_user> createState() => _Admin_home_userState();
}

class _Admin_home_userState extends State<Admin_home_user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // SizedBox(
              //   height: 70,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 280),
              //   child: SizedBox(
              //     height: 80,
              //     width: 80,
              //     child: CircleAvatar(
              //       backgroundImage: ExactAssetImage("assets/images/person.png"),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 110),
              //   child: Row(
              //     children: [
              //      ElevatedButton(onPressed: (){}, child:Text("User",style: TextStyle(color: Colors.blue),)),
              //       ElevatedButton(onPressed: (){}, child:Text("Mechanic",style: TextStyle(color: Colors.blue),))
              //     ],
              //   ),
              // ),
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

                          height: 100,
                          width: 200,


                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,


                            children: [
                              SizedBox(
                                  height:50,
                                  width: 50,
                                  child: Image.asset("assets/images/men.png")),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text("Location",),
                                  Text("Mobile number"),
                                  Text("Email"),
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
