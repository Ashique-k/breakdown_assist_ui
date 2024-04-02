import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
class USER_PROFILE extends StatefulWidget {
  const USER_PROFILE({super.key});

  @override
  State<USER_PROFILE> createState() => _USER_PROFILEState();
}

class _USER_PROFILEState extends State<USER_PROFILE> {
  var imageURL;
  XFile? _image;

  Future<void> pickimage() async {
    print("object");
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? pickedimage = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedimage != null) {
        setState(() {
          _image = pickedimage;
        });
        print("Image upload succersfully");
        await Uploadimage();
      }
    } catch (e) {
      print("Error picking image:$e");
    }
  }

  Future<void> Uploadimage() async {
    try {
      if (_image != null) {
        Reference storrageReference =
        FirebaseStorage.instance.ref().child('profile/${_image!.path}');
        await storrageReference.putFile(File(_image!.path));
        imageURL = await storrageReference.getDownloadURL();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Uploaded succesfully",
              style: TextStyle(color: Colors.green),
            )));

        FirebaseFirestore.instance
            .collection("usersignup")
            .doc(ID)
            .update({"path": imageURL});
        print("/////////picked$imageURL");
      } else
        CircularProgressIndicator();
    } catch (e) {
      print("Error uploading image:$e");
    }
  }

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
                user?['path']==""?

                CircleAvatar(
                  backgroundImage: ExactAssetImage("assets/images/person.png"),

                ):

                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(user?['path']),
                ),
                IconButton(onPressed: (){
                  pickimage();

                }, icon: Icon(Icons.camera_alt)),
                Text(user?['username']),
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

