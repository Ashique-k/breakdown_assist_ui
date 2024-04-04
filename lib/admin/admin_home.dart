
import 'package:flutter/material.dart';

import 'Admin_tab.dart';
import 'admin_notification.dart';
import 'admin_payment.dart';
class Admin_home extends StatefulWidget {
  const Admin_home({super.key});

  @override
  State<Admin_home> createState() => _Admin_homeState();
}

class _Admin_homeState extends State<Admin_home> {
  int _indexNum=0;
  List tabs = [
    Home(),
    Admin_payment(),
    Admin_notification(),


  ];
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundImage: ExactAssetImage("assets/images/person.png"),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(

            items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Payment",
            icon: Icon(Icons.payments)
            ,),
          BottomNavigationBarItem(
              label: "notification",
              icon: Icon(Icons.notification_add))
        ],
            iconSize: 25,



            currentIndex: _indexNum,
            onTap: (int index){

              setState(() {
                _indexNum= index;
              });

            }
        ),
        body: tabs.elementAt(_indexNum),

      ),








    );
  }
}
