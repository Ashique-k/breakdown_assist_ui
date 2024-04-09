import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'User_Mechanic.dart';
import 'User_Request.dart';
import 'User_notification.dart';
import 'User_profile.dart';

class USER_HOME extends StatefulWidget {
  const USER_HOME({Key? key}) : super(key: key);
  @override
  State<USER_HOME> createState() => _USER_HOMEState();
}

class _USER_HOMEState extends State<USER_HOME> {
  String? _selectedLocation = 'All Locations';
  List<String> _locations = [];

  @override
  void initState() {
    super.initState();

    _fetchLocations();
  }


  void _fetchLocations() async {

    _locations.clear();

    _locations.add('All Locations');

    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('mechsignup').get();
    List<String> locations = [];
    querySnapshot.docs.forEach((doc) {
      locations.add(doc['location']);
    });
    setState(() {
      _locations.addAll(locations);
    });
  }


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
             title:  DropdownButton<String>(
               dropdownColor: Colors.white,
               value: _selectedLocation,
               icon: Icon(Icons.arrow_drop_down),
               onChanged: (String? newValue) {
                 setState(() {
                   _selectedLocation = newValue;
                 });
               },
               items: _locations.map<DropdownMenuItem<String>>((String value) {
                 return DropdownMenuItem<String>(
                   value: value,
                   child: Text(value),
                 );
               }).toList(),
             ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => USER_NOTIFICATION()));
                },
                icon: Icon(
                  Icons.notifications,
                  color: Colors.amber,
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(48.0),
              child: Container(
                color: Colors.indigoAccent.shade100,
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.indigo.shade50),
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  tabs: [
                    Tab(
                      child: Text(
                        "Mechanic",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Request",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              USER_MECHANIC(
                  selectedLocation: _selectedLocation == 'All Locations'
                      ? null
                      : _selectedLocation),
              USER_REQUEST(),
            ],
          ),
        ),
    );
  }
}
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15)
//               ),
//               height: 50,
//               width: 200,
//               child: TextField(
//
//                 decoration: InputDecoration(
//
//                   hintText: "Search",
//                   hintStyle: GoogleFonts.abhayaLibre(),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0)
//                   ),
//                   prefixIcon: Icon(Icons.search)
//                 ),
//               ),
//             ),
//             actions: [
//               IconButton(onPressed: (){
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => USER_NOTIFICATION()),
//       );
//
//               }, icon: Icon(Icons.notification_add,color: Colors.yellow.shade400,))
//             ],
//           ),
//
//
//           bottomSheet: Card(
//
//             child: TabBar(
//               indicatorSize: TabBarIndicatorSize.tab,
//               indicator: BoxDecoration(
//                 color: Colors.indigoAccent.shade100,
//                 borderRadius: BorderRadius.circular(10)
//               ),
//
//
//                 tabs: [
//               Tab(
//                 child: Text("Mechanic",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
//
//               ),
//               Tab(
//
//                 child: Text("Request",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
//               )
//             ]),
//           ),
//           body: TabBarView(children: [
//             USER_MECHANIC(),
//             USER_REQUEST(),
//
//
//           ]),
//
//
//         ));
//   }
// }
