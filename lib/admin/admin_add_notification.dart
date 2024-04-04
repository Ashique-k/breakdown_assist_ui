import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class Admin_add_notification extends StatefulWidget {
  const Admin_add_notification({super.key});

  @override
  State<Admin_add_notification> createState() => _Admin_add_notificationState();
}

class _Admin_add_notificationState extends State<Admin_add_notification> {
  final _formkey=GlobalKey<FormState>();
  var matterctrl=TextEditingController();
  var contentctrl=TextEditingController();
  final date = new DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Future<dynamic> submit()async{
    await FirebaseFirestore.instance.collection("notification").add({
      "matter":matterctrl.text,
      "content":contentctrl.text,
      'time':time.format(context),
      'date':DateFormat('yyyy-MM-dd').format(date),
      "status":0
    }).then((value) => {
    Navigator.pop(context),
    });
    matterctrl.clear();
    contentctrl.clear();


  }
  final SnackBar _bar=SnackBar(content: Text("Added"),duration: Duration(seconds: 3),);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Text("Enter matter",style: GoogleFonts.acme()),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: matterctrl,
                  validator:  (value) {
                    if (value == null || value.isEmpty) {   // Validation Logic
                      return 'required field';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "matter",
                    hintStyle: GoogleFonts.acme(),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),

                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Text("Enter content",style: GoogleFonts.acme()),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: 500,

                  child: Container(

                    width: 250,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide.none
                      )
                    ),
                    child: TextFormField(
                      maxLines: 6,
                      controller: contentctrl,
                      validator:  (value) {
                        if (value == null || value.isEmpty) {   // Validation Logic
                          return 'required field';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "content...",
                        hintStyle: GoogleFonts.acme(),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),

                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 180,
              ),
              SizedBox(
                  width: 250,
                  child: ElevatedButton(onPressed: (){
                    submit();
                    ScaffoldMessenger.of(context).showSnackBar(_bar);
                    // Navigator.pop(context);

                  }, child: Text("Submit",style: GoogleFonts.abel()),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.indigo.shade200
                    ),

                  ),

              )



            ],
          ),
        ),
      ),
    );
  }
}
