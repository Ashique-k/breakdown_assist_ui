import 'package:flutter/material.dart';

class Accept_reject extends StatefulWidget {
  const Accept_reject({super.key});

  @override
  State<Accept_reject> createState() => _Accept_rejectState();
}

class _Accept_rejectState extends State<Accept_reject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset("assets/images/men.png"),
            Text("Name"),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Text("Problem"),
                SizedBox(
                  width: 30,

                ),
                Text(":"),
                SizedBox(
                  height: 20,

                ),
                Text("Complaint"),
                SizedBox(
                  height: 10,
                ),
                Text("Place"),
                SizedBox(
                  width: 30,

                ),
                Text(":"),
                SizedBox(
                  height: 20,

                ),
                Text("location"),
                SizedBox(
                  height: 10,
                ),
                Text("Date"),
                SizedBox(
                  width: 30,

                ),
                Text(":"),
                SizedBox(
                  height: 20,

                ),
                Text("YYYY/mm/dd"),
                SizedBox(
                  height: 10,
                ),
                Text("Time"),
                SizedBox(
                  width: 30,

                ),
                Text(":"),
                SizedBox(
                  height: 20,

                ),
                Text("Time"),
                SizedBox(
                  height: 10,
                ),
                Text("Contact no"),
                SizedBox(
                  width: 30,

                ),
                Text(":"),
                SizedBox(
                  height: 20,

                ),
                Text("00000"),
                ElevatedButton(onPressed: (){

                }, child: Text("Accept"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
                ),
                SizedBox(
                  width: 30,

                ),
                ElevatedButton(onPressed: (){

                }, child: Text("Reject"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                ),
              ],

            )
          ],
          
        ),
      ),
    );
  }
}
