import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Mech_Detail extends StatefulWidget {
  const User_Mech_Detail({super.key, required this.id});
  final id;
  @override
  State<User_Mech_Detail> createState() => _User_Mech_DetailState();
}

class _User_Mech_DetailState extends State<User_Mech_Detail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  var ID = '';

  Future<void> getdata() async {
    final prefs = await SharedPreferences.getInstance();
    ID = prefs.getString('id')!;

    setState(() {
      // print("get it");
    });
  }

  final date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  String dropdownvalue = 'engine repair';

  var items = [
    'fuel leaking',
    'Ac repairing',
    'engine oil change',
    'engine repair',
  ];
  DocumentSnapshot? mech;

  getfirebase() async {
    print('object1');
    mech = await FirebaseFirestore.instance
        .collection('mechsignup')
        .doc(widget.id)
        .get();
    getuser();
    print("get mech");
  }

  DocumentSnapshot? user;

  getuser() async {
    print('object2');
    user =
        await FirebaseFirestore.instance.collection('usersignup').doc(ID).get();
    print("get user");
  }

  var locationctrl = TextEditingController();

  Future<dynamic> mechreq() async {
    print("got it");
    await FirebaseFirestore.instance.collection('Mechreq').add({
      "work": dropdownvalue,
      "payment": 0,
      "status": 0,
      "time": time.format(context),
      "date": DateFormat('dd/MM/yyyy').format(date),
      "userprofile": user?['path'],
      // "mechprofile":mech?['path'],
      "mechusername": mech?['username'],
      "username": user!['username'],
      "experience": mech!['experience'],


      "location": locationctrl.text,
      "mechphone": mech!['phone'],
      "mechid": widget.id,
      "userid":ID,
    });
    print("done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SERVICE",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: FutureBuilder(
              future: getfirebase(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.asset("assets/images/person.png")),
                    SizedBox(
                      height: 4,
                    ),
                    Text(mech?['username']),
                    SizedBox(
                      height: 15,
                    ),
                    Text(mech?['phone']),
                    SizedBox(
                      height: 5,
                    ),
                    Text(mech?['experience']),
                    SizedBox(
                      height: 4,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Activate",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 150),
                      child: Text(
                        "Add Needed Service",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 60,
                      width: 260,
                      child: DropdownButton(
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            print(dropdownvalue);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 250),
                      child: Text("Place"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: 300,
                      child: TextFormField(
                        controller: locationctrl,
                        decoration: InputDecoration(
                            hintText: 'location',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {
                          mechreq();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange),
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
