import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'mech_accept_reject.dart';
class MECH_SERVICE_HOME extends StatefulWidget {
  const MECH_SERVICE_HOME({super.key});

  @override
  State<MECH_SERVICE_HOME> createState() => _MECH_SERVICE_HOMEState();
}

class _MECH_SERVICE_HOMEState extends State<MECH_SERVICE_HOME> {
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  var ID = '';

  Future<void> getdata() async {
    final prefs = await SharedPreferences.getInstance();
    ID = prefs.getString('id')!;

    setState(() {
      // print("get it");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              Container(
                height: 850,
                width: 470,
                child: FutureBuilder(

        future: FirebaseFirestore.instance.collection("Mechreq").where('mechid'
        , isEqualTo: ID).get(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (snapshot.hasError) {
        return Center(
          child: Text("Error:${snapshot.error}"),
        );
      }

      final mech = snapshot.data?.docs ?? [];
      return Container(
        height: 50,
        width: 200,
        child: Card(

          child: ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(

                    color: Colors.white,
                    thickness: 20,
                  ),
              itemCount: mech.length,
              itemBuilder: (BuildContext context, int index) {
                return
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Accept_reject(id:mech[index].id)),
                      );

                    },
                    child: Container(

                      height: 100,
                      width: 200,


                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,


                        children: [
                          SizedBox(
                              height: 70,
                              width: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  mech[index]['userprofile']==''?
                                  CircleAvatar(
                                    backgroundImage: ExactAssetImage("assets/images/person.png"),
                                  ):
                                  CircleAvatar(
                                    radius: 90,
                                    backgroundImage: NetworkImage(mech[index]['userprofile']),
                                  ),
                                  Text(mech[index]['mechusername'], style: TextStyle(fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),)
                                ],
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(mech[index]['work'],
                                style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(mech[index]['date'],),
                              Text(mech[index]['time']),
                              Text(mech[index]['location']),


                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20),
                              //   child: ElevatedButton(onPressed: (){}, child: Text("Payment Sucessfull"),
                              //   style: ElevatedButton.styleFrom(
                              //     backgroundColor: Colors.green
                              //   ),
                              //   ),
                              // ),
                            ],
                          ),

                        ],

                      ),

                    ),
                  );
              }


          ),
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
