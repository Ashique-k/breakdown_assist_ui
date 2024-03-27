import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class USER_PROFILE extends StatefulWidget {
  const USER_PROFILE({super.key});

  @override
  State<USER_PROFILE> createState() => _USER_PROFILEState();
}

class _USER_PROFILEState extends State<USER_PROFILE> {
  @override
  void initState() {
    // TODO: implement initState
    getdata();
    super.initState();
  }
  var ID='';
  String name='';
  String phone='';
  String email='';
  void getdata()async{
    final data = await SharedPreferences.getInstance();
    setState(() {
      ID = data.getString('id')!;
    });
    
  }
  DocumentSnapshot? user;
  getupdatedata()async{
    user=
        await FirebaseFirestore.instance.collection('usersignup').doc(ID).get();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getupdatedata(),
      builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Text("Error${snapshot.error}");
        }

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                ),
                SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset("assets/images/person.png")),
                Text("Name"),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text("Enter Your Name", style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: user?['username'],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text("Enter Your Phone ", style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: user?['phone'],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 200),
                  child: Text("Enter Your Email", style: TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: user?['email'],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(onPressed: () {
                    Navigator.pop(context);
                  },
                    child: Text(
                      "Submit", style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange
                    ),
                  ),
                )

              ],
            ),
          ),
        );
      }
    );
    }
  }

