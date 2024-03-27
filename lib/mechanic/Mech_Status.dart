import 'package:flutter/material.dart';

class mech_status extends StatefulWidget {
  const mech_status({super.key});

  @override
  State<mech_status> createState() => _mech_statusState();
}

class _mech_statusState extends State<mech_status> {

  String? gender;
  var a;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 150,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.orangeAccent,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/men.png"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Fuel Leaking",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "Date",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "Time",
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        "Place",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 200, 0),
            child: Text(
              "Add status",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            width: double.infinity,
            child: Column(children: [
              RadioListTile(
                  activeColor: Colors.blue,
                  title: Text(
                    "Completed",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                  ),
                  value: "b",
                  groupValue: gender,
                  onChanged: (value) {
                    if (value == "b") {
                      a = 1;
                    }
                    setState(() {
                      print(value);
                      gender = value.toString();
                    });
                  }),
              RadioListTile(
                  activeColor: Colors.blue,
                  title: Text("Not completed",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
                  value: "f",
                  groupValue: gender,
                  onChanged: (value) {
                    print(value);
                    if (value == "f") {
                      a = 2;
                    }
                    gender = value.toString();
                    setState(() {});
                  }),
            ]),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: a == 1
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 225, 0),
                        child: Text("Amount", style: TextStyle(fontSize: 20)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 90),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              prefixIcon: Icon(Icons.currency_rupee)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(170, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.orangeAccent,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {},
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  )
                :a==2? Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child: Text(
                        "Reject Reason",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: TextFormField(
                          maxLines: 5,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent),
                      ),
                    ),
                  ]):Text('Choose an Option'),
          ),
        ],
      ),
    ));
  }
}
