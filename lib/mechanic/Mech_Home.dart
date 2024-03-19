
import 'package:breakdown_assist/mechanic/mech_edit_profile.dart';
import 'package:breakdown_assist/mechanic/mech_rating.dart';
import 'package:breakdown_assist/mechanic/mech_service_page.dart';
import 'package:breakdown_assist/mechanic/mech_tab.dart';
import 'package:flutter/material.dart';

import 'notification_mech.dart';




class MECH_HOME extends StatefulWidget {
  const MECH_HOME({super.key});

  @override
  State<MECH_HOME> createState() => _MECH_HOMEState();
}

class _MECH_HOMEState extends State<MECH_HOME> {
  int _indexNum=0;
  List tabs = [
    MECH_TAB(),
    Service_page(),
    MECH_RATING(),


  ];
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          
          leading: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Edit_profile()),
              );


            },
            child: CircleAvatar(

              backgroundImage: ExactAssetImage("assets/images/person.png"),
            ),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Nofification_Mech()),
              );


            }, icon: Icon(Icons.notification_add_outlined))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            label: "Request",
            icon: Icon(Icons.person_search),
          ),
          BottomNavigationBarItem(
            label: "Service",
            icon: Icon(Icons.miscellaneous_services)
            ,),
          BottomNavigationBarItem(
              label: "Rating",
              icon: Icon(Icons.eighteen_up_rating_outlined))
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

