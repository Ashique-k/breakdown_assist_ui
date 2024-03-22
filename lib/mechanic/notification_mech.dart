import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Nofification_Mech extends StatefulWidget {
  const Nofification_Mech({super.key});

  @override
  State<Nofification_Mech> createState() => _Nofification_MechState();
}

class _Nofification_MechState extends State<Nofification_Mech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("notification").get(),
    builder: (context,AsyncSnapshot<QuerySnapshot>snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(

          ),
        );
      }
      if (snapshot.hasError) {
        return Center(
          child: Text("Error:${snapshot.error}"),
        );
      }
      final _notify = snapshot.data?.docs ?? [];

      return ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(thickness: 5, color: Colors.white,),
          itemCount: _notify.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20
              ),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all()
                ),
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       Column(
                         children: [

                           Text(_notify[index]["content"]),
                           Text(_notify[index]["matter"]),
                         ],
                       ),
                        SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(_notify[index]["time"]),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(255, 20, 0, 0),
                      child: Text(_notify[index]["date"]),
                    ),
                  ],
                ),
              ),
            );
          }
      );
    }
        )
    );
  }
}
