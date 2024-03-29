import 'package:breakdown_assist/mechanic/Mech_Home.dart';
import 'package:breakdown_assist/mechanic/edit_mech_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Edit_profile extends StatefulWidget {
  const Edit_profile({super.key});

  @override
  State<Edit_profile> createState() => _Edit_profileState();



}

class _Edit_profileState extends State<Edit_profile> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();

  }
var ID='';


  // String username='';
  // String phone='';
  // String email='';
  // String experience='';
  // String shop='';
  // String location='';
  // String Id='';



Future<void>getdata()async{
  SharedPreferences prefs =await SharedPreferences.getInstance();
  // username = data.getString('username')!;
  // phone = data.getString('phone')!;
  // email = data.getString('email')!;
  // experience = data.getString('experience')!;
  // shop = data.getString('shop')!;
  // location =data.getString('location')!;
  // ID = prefs.getString('id')!;
  setState(() {
    ID = prefs.getString('id')!;
  });

}
DocumentSnapshot ? mech;
  Getupdatedata()async{
    mech= await FirebaseFirestore.instance.collection('mechsignup').doc((ID)).get();


  }




  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Getupdatedata(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(snapshot.hasError){
          return Text('Error${snapshot.error}');
        }


      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MECH_PROFILE()),
              );


            }, icon: Icon(Icons.edit))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/images/person.png")),
              SizedBox(
                height: 8,

              ),
              // TextFormField(
              //   readOnly: true,
              //   decoration: InputDecoration(
              //     hintText: username,hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
              //
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10)
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 3,

              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: mech?['username'],hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
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
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: mech?['phone'],hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
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
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: mech?['email'],hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
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
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: mech?['experience'],hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
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
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "location",hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
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
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: mech?['shop'],hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
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
                child: ElevatedButton(onPressed: (){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MECH_HOME()),
                );

                }, child: Text("done"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
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

