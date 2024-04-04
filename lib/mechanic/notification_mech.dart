import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          backgroundColor: Colors.indigo.shade200,
          title: Text("Notification",style: GoogleFonts.acme()),
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

      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView.separated(
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
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [

                             Text(_notify[index]["matter"],
                             style: GoogleFonts.acme(),),
                             Text(_notify[index]["content"],
                             style: GoogleFonts.aclonica(),
                             ),
                           ],
                         ),
                          SizedBox(
                            width: 50,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                            child: Text(_notify[index]["date"],
                            style: GoogleFonts.acme(),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(230, 20, 0, 0),
                        child: Text(_notify[index]["time"],

                        style: GoogleFonts.acme(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      );
    }
        )
    );
  }
}
