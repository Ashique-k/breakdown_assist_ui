import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'User_Mechanic.dart';
import 'User_Request.dart';
import 'User_notification.dart';
import 'User_profile.dart';

class USER_HOME extends StatefulWidget {
  const USER_HOME({super.key});

  @override
  State<USER_HOME> createState() => _USER_HOMEState();
}

class _USER_HOMEState extends State<USER_HOME> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController
      (length: 2,
        initialIndex: 0,


        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo.shade200,
            leading: InkWell(
              onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => USER_PROFILE()),
      );


              },
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
            ),
            title: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              height: 50,
              width: 200,
              child: TextField(

                decoration: InputDecoration(

                  hintText: "Search",
                  hintStyle: GoogleFonts.abhayaLibre(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  prefixIcon: Icon(Icons.search)
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => USER_NOTIFICATION()),
      );

              }, icon: Icon(Icons.notification_add,color: Colors.yellow.shade400,))
            ],
          ),


          bottomSheet: Card(

            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                color: Colors.indigoAccent.shade100,
                borderRadius: BorderRadius.circular(10)
              ),


                tabs: [
              Tab(
                child: Text("Mechanic",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),

              ),
              Tab(

                child: Text("Request",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              )
            ]),
          ),
          body: TabBarView(children: [
            USER_MECHANIC(),
            USER_REQUEST(),


          ]),


        ));
  }
}
