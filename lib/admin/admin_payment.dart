import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Admin_payment extends StatefulWidget {
  const Admin_payment({super.key});

  @override
  State<Admin_payment> createState() => _Admin_paymentState();
}

class _Admin_paymentState extends State<Admin_payment> {
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
                child: Container(
                  height: 50,
                  width: 150,
                  color: Colors.orange.shade50,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: FutureBuilder(
    future: FirebaseFirestore.instance.collection("Mechreq").where('payment',isEqualTo: 5).get(),
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
      final mech = snapshot.data?.docs ?? [];

      return ListView.separated(
          separatorBuilder: (context, index) =>
              Divider(
                color: Colors.white,

                thickness: 3,
                height: 50,
              ),
          itemCount: mech.length,
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
                      width: 18,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(mech[index]['username'],
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 200,
                            ),
                            Text(mech[index]['date'],
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Text(mech[index]['completed']),
                        Text(mech[index]['work']),
                        Text(mech[index]['mechusername']),
                      ],
                    )
                  ],

                ),

              );
          }


      );
    }
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
