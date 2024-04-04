import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          backgroundColor: Colors.indigoAccent.shade100,
          title: Text("Notification",style: GoogleFonts.acme()),
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
                                  style: GoogleFonts.acme()),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                              child: Text(_notify[index]['time'],
                              style: GoogleFonts.acme(),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Text(_notify[index]['content'],
                                  style: GoogleFonts.aclonica()),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                              child: Text(_notify[index]['date'],
                              style: GoogleFonts.acme(),
                              ),
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

