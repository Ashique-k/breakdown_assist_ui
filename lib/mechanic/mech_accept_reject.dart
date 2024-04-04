import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Accept_reject extends StatefulWidget {
  const Accept_reject({super.key,required this.id});
  final id;

  @override
  State<Accept_reject> createState() => _Accept_rejectState();
}

class _Accept_rejectState extends State<Accept_reject> {
  DocumentSnapshot? detail;

  getData() async {
    detail = await FirebaseFirestore.instance
        .collection('Mechreq')
        .doc(widget.id)
        .get();
  }

  void accept(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('Mechreq')
          .doc(id)
          .update({'status': 1});
    });
  }

  void rejects(id) {
    setState(() {
      FirebaseFirestore.instance
          .collection('Mechreq')
          .doc(id)
          .update({'status': 2});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.indigo.shade100
          ),
          child: FutureBuilder(
        future: getData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (snapshot.hasError) {
        return Text("Error:${snapshot.error}");
      }


      return Column(
        children: [
          SizedBox(
            height: 5,
          ),
          detail!['userprofile'] == ''
              ? CircleAvatar(
            radius: 40,
            backgroundImage: ExactAssetImage(
                "assets/images/person.png"),
          )
              : CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                detail!['userprofile']),
          ),
          Text(detail?['username'],
            style: GoogleFonts.acme()),
          SizedBox(
            height: 60,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Problem", style: GoogleFonts.acme()),
              Text(detail?['work'],
                style: GoogleFonts.acme()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Place", style: GoogleFonts.acme()),
              Text(detail?['location'], style: GoogleFonts.acme()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Date", style: GoogleFonts.acme()),
              Text(detail?['date'], style: GoogleFonts.acme()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Time", style: GoogleFonts.acme()),

              Text(detail?['time'], style: GoogleFonts.acme()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("", style: TextStyle(fontSize: 20),),
              Text("", style: TextStyle(fontSize: 20),),
            ],
          ),
          SizedBox(
            height: 130,
          ),
          detail!['status']==0?Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade400,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1))
                  ),
                  onPressed: () {
                    accept(widget.id);
                  },
                  child: Text("Accept", style: TextStyle(fontSize: 20),)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))
                  ),
                  onPressed: () {
                    rejects(widget.id);
                  },
                  child: Text("Reject", style: TextStyle(fontSize: 20)

                  ),

              )
            ],
          ):detail!['status']==1?
              SizedBox(
                height: 40,
                width: 150,
                child: ElevatedButton(onPressed: (){

                }, child: Text("accept"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)
                    ),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white
                  ),

                ),
              ):SizedBox(
            height: 30,
                width: 250,

                child: ElevatedButton(onPressed: (){}, child: Text("reject"),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2)
                              ),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white
                            ),

                          ),
              ),
        ],
      );
    }
          ),
        ),
      ),
    );
  }
}