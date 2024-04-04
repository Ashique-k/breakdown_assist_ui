import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String ?dropdownvalue;


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
      "mechprofile": mech?["path"],
      "mechusername": mech?['username'],
      "username": user!['username'],
      "experience": mech!['experience'],
      "location": locationctrl.text,
      "mechphone": mech!['phone'],
      "mechid": widget.id,
      "userid": ID,
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
        backgroundColor: Colors.indigoAccent.shade100,
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
                    Text(mech?['username'],
                    style: GoogleFonts.acme(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(mech?['phone'],
                    style: GoogleFonts.acme(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(mech?['experience'],
                    style: GoogleFonts.acme(),
                    ),
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
                      padding: const EdgeInsets.only(right: 200),
                      child: Text(
                        "Add Needed Service",
                        style:GoogleFonts.acme()
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('services')
                              .where("mechid", isEqualTo: widget.id)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const SizedBox();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<String> tradeList = snapshot.data!.docs
                                  .map((DocumentSnapshot document) =>
                                      document['service'].toString())
                                  .toList();

                              return Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black54),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: DropdownButton<String>(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 35, vertical: 3),
                                      underline: const SizedBox(),
                                      borderRadius: BorderRadius.circular(10),
                                      hint:  Text(
                                          "choose your needed service",
                                      style: GoogleFonts.acme(),
                                      ),
                                      value: dropdownvalue,
                                      // Set initial value if needed
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownvalue = newValue!;
                                          print(dropdownvalue);
                                        });
                                      },

                                      items: tradeList
                                          .map<DropdownMenuItem<String>>(
                                              (String value) =>
                                                  DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(
                                                        style: GoogleFonts.acme(),
                                                        value),
                                                  ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        )
                      ],
                    ),

//
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 220),
                      child: Text("Place",style: GoogleFonts.acme(),),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      width: 270,
                      child: TextFormField(
                        maxLines: 5,
                        controller: locationctrl,
                        decoration: InputDecoration(
                            hintText: 'location',
                            hintStyle: GoogleFonts.acme(),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () {
                          mechreq();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Submit",
                          style: GoogleFonts.abel()
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                          ),
                          shadowColor: Colors.blueGrey.shade50,
                          foregroundColor: Colors.white,
                            backgroundColor: Colors.indigoAccent.shade100),

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
