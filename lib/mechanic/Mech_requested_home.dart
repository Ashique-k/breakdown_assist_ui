import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mech_Status.dart';

class Mechanic_request extends StatefulWidget {
  const Mechanic_request({super.key});

  @override
  State<Mechanic_request> createState() => _Mechanic_requestState();
}

class _Mechanic_requestState extends State<Mechanic_request> {
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
      // appBar: AppBar(
      //   actions: [
      //     Icon(Icons.notification_add),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 850,
                width: 470,
                child:  FutureBuilder(

        future: FirebaseFirestore.instance.collection("Mechreq").where('status'
        , isEqualTo: 1).get(),
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
                    thickness: 5,

                  ),
              itemCount: mech.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    mech[index]['payment']==0?
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => mech_status(id: mech[index].id,)),
                    ):null;
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
                              children: [
                                mech[index]['userprofile']==''?
                                CircleAvatar(
                                  backgroundImage: ExactAssetImage("assets/images/person.png"),
                                ):
                                CircleAvatar(
                                  radius: 100,
                                  backgroundImage: NetworkImage(mech[index]['path']),
                                ),
                                Text(mech[index]['userprofile']),
                              ],
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              mech[index]['work'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold),

                            ),
                            Text(mech[index]['location']),

                            Text(mech[index]['date']),
                            Row(
                              children: [
                                Text(mech[index]['time']),
                                SizedBox(
                                  width: 30,
                                ),

                                mech[index]['payment']==3?Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    color: Colors.blue.shade200,
                                    child:Center(child: Text ("pending",style: TextStyle(fontSize: 12),)),

                                  ),
                                )
                                    :mech[index]['payment']==4?
                                Container(
                                  height: 20,
                                  width: 40,
                                  color: Colors.red.shade200,
                                  child: Text("Failed"),

                                ):
                                mech[index]['payment']==5?
                                Padding(
                                  padding: const EdgeInsets.only(left: 50),
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    color: Colors.green.shade200,
                                    child: Center(child: Text("Sucessfull")),
                                  ),
                                ):
                                mech[index]['payment']==6?
                                Container(
                                  height: 20,
                                  width: 40,
                                  color: Colors.green.shade200,
                                  child: Text("complete"),
                                ):Text("ok"),


                              ],
                            ),


                              // Container(
                            //   alignment: Alignment.centerRight,
                            //
                            //   height: 27,
                            //   width: 150,
                            //
                            //   color: Colors.green,
                            //   child: Center(child: Text("payment sucess")),
                            // )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      );
    }
                ),
                    ),

            ],
          ),
        ),
      ),
    );
  }
}
