
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MECH_PROFILE extends StatefulWidget {
  const MECH_PROFILE({super.key});


  @override
  State<MECH_PROFILE> createState() => _MECH_PROFILEState();






}

class _MECH_PROFILEState extends State<MECH_PROFILE> {

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
        await uploadimage();
      }
    } catch (e) {
      print("Error picking image:$e");
    }
  }

  Future<void> uploadimage() async {
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
            .collection("mechsignup")
            .doc(Id)
            .update({"path": imageURL});
        print("/////////picked$imageURL");
      } else
        CircularProgressIndicator();
    } catch (e) {
      print("Error uploading image:$e");
    }
  }





  void initState() {
    // TODO: implement initState

    super.initState();
    getdata();
  }

  // var namectrl=TextEditingController();
  var usernamectrl =TextEditingController();
  var phonectrl =TextEditingController();
  var emailctrl =TextEditingController();
  var experiencectrl =TextEditingController();
  var locationctrl =TextEditingController();
  var shopctrl =TextEditingController();
 
  var Id ='';

  getdata()async{
    final data = await SharedPreferences.getInstance();
    Id = data.getString('id')!;

    setState(() {});
  }
  
  void update()async{
    await FirebaseFirestore.instance.collection('mechsignup').doc(Id).update({
   'username':usernamectrl.text,
      'phone':phonectrl.text,
      'email':emailctrl.text,
      'experience':experiencectrl.text,
      'location':locationctrl.text,
      'shop':shopctrl.text,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: [
      //     IconButton(onPressed: (){
      //
      //
      //     }, icon: Icon(Icons.edit))
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),

              CircleAvatar(
                radius: 70,
                backgroundImage: ExactAssetImage("assets/images/person.png"),
              ),
              IconButton(onPressed: (){
                pickimage();

              }, icon: Icon(Icons.camera_alt)),




            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: usernamectrl,
                decoration: InputDecoration(
                  hintText: "UserName",
                  labelText: "Enter Username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: phonectrl,
                decoration: InputDecoration(
                  hintText: "Phone number",
                  labelText: "Enter phone number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailctrl,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Enter Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: experiencectrl,
                decoration: InputDecoration(
                  hintText: "Experience",
                  labelText: "Work Experience",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: locationctrl,
                decoration: InputDecoration(
                  hintText: "Location",
                  labelText: "Enter Location",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: shopctrl,
                decoration: InputDecoration(
                  hintText: "Shop name",
                  labelText: "Enter Shopname",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,

            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50 ,
              width: 300,
              child: ElevatedButton(onPressed: ()async{
                update();



              }, child: Text("Submit"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade200,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}
