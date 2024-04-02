import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'ADMIN_USER.dart';
class Admin_home_user extends StatefulWidget {
  const Admin_home_user({super.key});

  @override
  State<Admin_home_user> createState() => _Admin_home_userState();
}

class _Admin_home_userState extends State<Admin_home_user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [

                Container(
                  height: 900,
                  width: 470,
                  child: FutureBuilder(
                    future: FirebaseFirestore.instance.collection("usersignup").get(),

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
                      final user = snapshot.data?.docs ?? [];
                      return Container(

                        height: 50,
                        width: 150,
                        child: Card(
                          child: ListView.separated(


                              separatorBuilder: (context, index) =>
                                  Divider(

                                    color: Colors.white,
                                    thickness: 3,
                                    height: 50,
                                  ),
                              itemCount: user.length,
                              itemBuilder: (BuildContext context, int index) {
                                return
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return Admin_User(id:user[index].id);
                                      }
                                      ));
                                    },

                                    child: Container(


                                      height: 100,
                                      width: 200,



                                      child: Row(

                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,


                                        children: [
                                          CircleAvatar(

                                            backgroundImage: ExactAssetImage("assets/images/men.png"),
                                            radius: 30,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(

                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [

                                              Text(user[index]["username"], style: TextStyle(
                                                  fontWeight: FontWeight.bold),),
                                              Text(user[index]["location"]),
                                              Text(user[index]["phone"]),
                                              Text(user[index]["email"]),
                                            ],
                                          ),
                                         user[index]['status']==0? Padding(
                                           padding: const EdgeInsets.only(left: 35),
                                           child: Container(
                                             height: 50,
                                             width: 150,
                                             color: Colors.blueAccent,
                                             child: Text("Pending",style: TextStyle(
                                               fontWeight: FontWeight.bold,fontSize: 12,color: Colors.white
                                             ),
                                           ),



                                           ),
                                         ):user[index]['status']==1?
                                             Padding(
                                               padding: const EdgeInsets.only(left: 40),
                                               child: Container(
                                                 height: 40,
                                                 width: 100,
                                                 color: Colors.green,
                                                 child: Center(child: Text("Accept",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),)),
                                               ),
                                             ):Container(
                                           height: 40,
                                           width: 100,
                                           color: Colors.red,
                                           child: Center(child: Text("Reject",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold),)),
                                         )
                                             // SizedBox(
                                             //   height: 50,
                                             //   width: 150,
                                             //   child: ElevatedButton(onPressed: (){}, child: Text("Accept"),
                                             //     style: ElevatedButton.styleFrom(
                                             //       shape: RoundedRectangleBorder(
                                             //         borderRadius: BorderRadius.circular(2)
                                             //       ),
                                             //       foregroundColor: Colors.white,
                                             //       backgroundColor: Colors.green
                                             //     ),
                                             //
                                             //   ),
                                             // ):ElevatedButton(onPressed: (){

                                         // }, child: Text("Reject"),
                                         //   style: ElevatedButton.styleFrom(
                                         //     foregroundColor: Colors.white,
                                         //     backgroundColor: Colors.red,
                                         //   ),
                                         // )

                                        ]

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
      ),


    );
  }
}
