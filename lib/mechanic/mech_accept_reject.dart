import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
          height: 550,
          width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade200
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
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/person.png"),
          ),
          Text(detail?['username'],
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(
            height: 60,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Problem", style: TextStyle(fontSize: 20),),
              Text(detail?['work'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Place", style: TextStyle(fontSize: 20),),
              Text(detail?['location'], style: TextStyle(fontSize: 20),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Date", style: TextStyle(fontSize: 20),),
              Text(detail?['date'], style: TextStyle(fontSize: 20),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Time", style: TextStyle(fontSize: 20),),

              Text(detail?['time'], style: TextStyle(fontSize: 20),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Contact Number", style: TextStyle(fontSize: 20),),
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