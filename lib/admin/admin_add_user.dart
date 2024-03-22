import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Admin_home_user extends StatefulWidget {
  const Admin_home_user({super.key});

  @override
  State<Admin_home_user> createState() => _Admin_home_userState();
}

class _Admin_home_userState extends State<Admin_home_user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    return ListView.separated(


                        separatorBuilder: (context, index) =>
                            Divider(
                              indent: 13,
                              endIndent: 50,
                              color: Colors.white,
                              thickness: 5,
                              height: 50,
                            ),
                        itemCount: user.length,
                        itemBuilder: (BuildContext context, int index) {
                          return
                            Container(

                              height: 100,
                              width: 200,


                              child: Row(

                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,


                                children: [
                                  SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.asset(
                                          "assets/images/men.png")),
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
                                  )
                                ],

                              ),

                            );
                        }


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
