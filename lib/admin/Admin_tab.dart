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

            TabBar(tabs: [Container(
              height: 40,
              width: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                ),
                color: Colors.orange.shade200,
                child: Tab(child: Text("User"),
                ),
              ),
            ),
              Container(
                height: 40,
                width: 200,
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    color: Colors.orange.shade200,
                    child: Tab(child:Text("Mechanic") ,)),
              )
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
