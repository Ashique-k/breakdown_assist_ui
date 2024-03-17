import 'package:flutter/material.dart';

class mech_status extends StatefulWidget {
  const mech_status({super.key});

  @override
  State<mech_status> createState() => _mech_statusState();
}

class _mech_statusState extends State<mech_status> {
  String ? status;
  bool ? value = false;
  bool ? values = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/men.png"),
            Text("Name"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Complaint"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Date"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Time"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Place"),
                    SizedBox(
                      height: 50,

                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),

                      child: Text("Add Status"),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 180,
                        ),
                        ListTile(
                          title: Text("Completed"),
                          leading: Radio(value: "Completed", groupValue: status, onChanged: (String ? value){
                            setState(() {
                              status=value;
                            });
                          }),


                        ),
                        SizedBox(
                          width: 5,
                        ),
                        ListTile(
                          title: Text("Not Completed"),
                          leading: Radio(value: "Not completed", groupValue: status, onChanged: (String ? values){
                            setState(() {
                              status=values;
                            });
                          }),


                        ),
                        SizedBox(
                          height: 50,

                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text("Amount"),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "2000/-",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)
                                )

                              ),
                            ),
                            SizedBox(
                              height: 20,

                            ),
                            ElevatedButton(onPressed: (){}, child: Text("Submit"))
                          ],
                        )


                      ],
                    )

                  ],
                )
              ],
            )
          ],
        ),
      ) ,
    );
  }
}
