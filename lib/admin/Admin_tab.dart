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

            TabBar(tabs: [Tab(child: Text("User"),
            ),
              Tab(child:Text("Mechanic") ,)
            ]),
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
