import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admin_add_user.dart';
import 'admin_home_mechanic.dart';



class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            Card(
              color: Colors.indigo.shade100,
              child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.blue.shade200,
                    shape: BoxShape.rectangle,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [Tab(child: Text("User"),
              ),
                Tab(child:Text("Mechanic") ,)
              ]),
            ),
            Expanded(
              child: TabBarView(children: [
                Admin_home_user(),
                Admin_home_mechanic(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
