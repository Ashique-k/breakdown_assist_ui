import 'package:flutter/material.dart';

import 'User_Mechanic.dart';
import 'User_Request.dart';

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
            backgroundColor: Colors.orange,
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/person.png"),
            ),
            title: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              height: 50,
              width: 230,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  prefixIcon: Icon(Icons.search)
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.notification_add,color: Colors.yellow,))
            ],
          ),


          bottomSheet: TabBar(tabs: [
            Tab(
              child: Text("Mechanic"),

            ),
            Tab(
              child: Text("Request"),
            )
          ]),
          body: TabBarView(children: [
            USER_MECHANIC(),
            USER_REQUEST(),


          ]),


        ));
  }
}
