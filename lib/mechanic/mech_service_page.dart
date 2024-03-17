import 'package:flutter/material.dart';
class Service_page extends StatefulWidget {
  const Service_page({super.key});

  @override
  State<Service_page> createState() => _Service_pageState();
}

class _Service_pageState extends State<Service_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Admin_add_notification()),
          // );

        } ,child: Icon(Icons.add),),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Service",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
      ),
      body: Card(
        child: Column(
          children: [
            Text("Type Punchure Service"),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.delete),
            Text("Engine Service"),
            SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            Icon(Icons.delete),
            Text("AC Service"),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.delete),
            SizedBox(
              height: 10,

            ),
            Text("Engine Service"),
            SizedBox(
              width: 5,
            ),
            Icon(Icons.delete)
          ],
        ),
      ),
    );
  }
}
