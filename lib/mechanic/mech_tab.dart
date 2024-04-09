import 'package:breakdown_assist/mechanic/Mech_accepted_home.dart';
import 'package:breakdown_assist/mechanic/Mech_request_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





class MECH_TAB extends StatefulWidget {
  const MECH_TAB({super.key});

  @override
  State<MECH_TAB> createState() => _MECH_TABState();
}

class _MECH_TABState extends State<MECH_TAB> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          children: [

            Card(
              color: Colors.indigo.shade100,
              child: TabBar(


                indicator: BoxDecoration(
                  color: Colors.blue.shade200,
                  shape: BoxShape.rectangle
                ),

                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [Tab(child: Text("Request"),
              ),
                Tab(child:Text("Accepted") ,)
              ]),
            ),
            Expanded(
              child: TabBarView(children: [
                MECH_REQ(),
                Mechanic_accept(),


              ]),
            )
          ],
        ),
      ),
    );
  }
}
