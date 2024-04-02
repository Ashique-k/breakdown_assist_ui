import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Mech_failed_page.dart';
import 'User_Mechanic_bill_page.dart';

class USER_REQUEST extends StatefulWidget {
  const USER_REQUEST({super.key});

  @override
  State<USER_REQUEST> createState() => _USER_REQUESTState();
}

class _USER_REQUESTState extends State<USER_REQUEST> {
  @override
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
                    future: FirebaseFirestore.instance
                        .collection("Mechreq")
                        .where('userid', isEqualTo: ID)
                        .get(),
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
                      return ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                                // indent: 13,
                                // endIndent: 60,
                                color: Colors.white,
                                thickness: 20,
                                // height: 50,
                              ),
                          itemCount: mech.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                mech[index]['payment'] == 3
                                    ? Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                USER_MECH_BILL_PAGE(
                                                  id: mech[index].id,
                                                )),
                                      )
                                    : mech[index]['payment'] == 4
                                        ? Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MECH_FAILED(id: mech[index].id,)))
                                        : null;
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
                                            // CircleAvatar(
                                            //   backgroundImage: AssetImage("assets/images/men.png"),
                                            //
                                            //
                                            // ),
                                            // Text("name"),
                                          ],
                                        )),
                                    // SizedBox(
                                    //   width: 20,
                                    // ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          mech[index]['mechusername'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(mech[index]['date']),
                                        Text(mech[index]['time']),
                                        Row(children: [
                                          Text(mech[index]['work']),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          mech[index]['payment'] == 3
                                              ? Container(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  height: 27,
                                                  width: 100,
                                                  color: Colors.green,
                                                  child: Center(
                                                      child: Text("Pay")),
                                                )
                                              : mech[index]['payment'] == 4
                                                  ? Container(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      height: 27,
                                                      width: 100,
                                                      color: Colors.red,
                                                      child: Center(
                                                          child:
                                                              Text("failed")),
                                                    )
                                                  : mech[index]['status'] == 1
                                                      ? Container(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          height: 27,
                                                          width: 100,
                                                          color: Colors.blue.shade200,
                                                          child: Center(
                                                              child:
                                                                  Text("Approved")),
                                                        )
                                                      : mech[index]
                                                                  ['status'] ==
                                                              2
                                                          ? Container(
                                                              alignment: Alignment
                                                                  .bottomRight,
                                                              height: 27,
                                                              width: 100,
                                                              color: Colors.red,
                                                              child: Center(
                                                                  child: Text(
                                                                      "rejected")),
                                                            )
                                                          : Text(""),
                                        ])
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
