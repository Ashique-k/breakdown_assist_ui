import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class USER_NOTIFICATION extends StatefulWidget {
  const USER_NOTIFICATION({super.key});

  @override
  State<USER_NOTIFICATION> createState() => _USER_NOTIFICATIONState();
}

class _USER_NOTIFICATIONState extends State<USER_NOTIFICATION> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.orange.shade200,
          title: Text("Notification",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
          centerTitle: true,
        ),
        body:  FutureBuilder(
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
          separatorBuilder: (context, index) => Divider(
            thickness: 5,
            color: Colors.white,
          ),
          itemCount: _notify.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(_notify[index]['matter'],
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                              child: Text(_notify[index]['time']),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(_notify[index]['content'],
                                  style: TextStyle(fontSize: 20)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                              child: Text(_notify[index]['date']),
                            )
                          ],
                        )
                      ]
                  ),
                )
            );
          });
    }
        )
    );
  }
}

