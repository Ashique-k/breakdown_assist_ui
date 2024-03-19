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
      body: Center(
        child: Container(
          height: 550,
          width: 330,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue.shade200
          ),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/person.png"),
              ),
              Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 60,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Problem",style: TextStyle(fontSize: 20),),
                  Text(": Fuel Leaking",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Place",style: TextStyle(fontSize: 20),),
                  Text(": Kozhikode",style: TextStyle(fontSize: 20),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Date",style: TextStyle(fontSize: 20),),
                  Text(": Date",style: TextStyle(fontSize: 20),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Time",style: TextStyle(fontSize: 20),),

                  Text(": Time",style: TextStyle(fontSize: 20),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Contact Number",style: TextStyle(fontSize: 20),),
                  Text(": 0000000000",style: TextStyle(fontSize: 20),),
                ],
              ),
              SizedBox(
                height: 130,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade400,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      onPressed: (){},
                      child: Text("Accept",style: TextStyle(fontSize: 20),)),
                  ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade400,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      onPressed: (){},
                      child: Text("Reject",style: TextStyle(fontSize: 20),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}