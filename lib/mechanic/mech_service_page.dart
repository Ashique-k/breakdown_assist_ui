import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service_page extends StatefulWidget {
  const Service_page({super.key});

  @override
  State<Service_page> createState() => _Service_pageState();
}

class _Service_pageState extends State<Service_page> {

  void delete(id){
    FirebaseFirestore.instance.collection('services').doc(id).delete()
        .then((value)  {
          setState(() {

          });
    }).catchError((onError){
      print("deleted");
    });
  }
  var servicectrl = TextEditingController();
  void initState() {
    // TODO: implement initState
    super.initState();
    getmechdetails();
  }

  var ID = '';

  void getmechdetails() async {
    final mechservice = await SharedPreferences.getInstance();

    ID = mechservice.getString('id')!;

    setState(() {});
  }


  final Snack =
      SnackBar(duration: Duration(seconds: 3), content: Text("Service added"));

  Future<dynamic> Submitservice() async {
    await FirebaseFirestore.instance
        .collection('services')
        .add({'service': servicectrl.text, 'mechid': ID}).then((value) {
      Navigator.pop(context);
      servicectrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade100,
        title: Text(
          "services",
          style: GoogleFonts.acme(),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    backgroundColor: Colors.indigo.shade100,
                    title: Center(
                      child: Text("Add service"),
                    ),
                    titleTextStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    content: SizedBox(
                      height: 200,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: servicectrl,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.blue.shade200))),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                              ),
                              onPressed: () {
                                Submitservice();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(Snack);
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(fontSize: 20),
                              ))
                        ],
                      ),
                    ),
                  ));
        },
        child: Icon(
            shadows: [],
            size: 35, Icons.add),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: Card(
            color: Colors.indigo.shade50,
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('services')
                    .where('mechid', isEqualTo: ID)
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error:${snapshot.error}"),
                    );
                  }
                  final serv = snapshot.data?.docs ?? [];
                  return ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            thickness: 1,
                            color: Colors.black,
                          ),
                      itemCount: serv.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(
                            serv[index]['service'],
                            style:GoogleFonts.acme(),
                          ),
                          trailing: IconButton(
                            onPressed: (){
                              delete(serv[index].id);


                            },
                            icon: Icon(Icons.delete),
                            iconSize: 30,
                          ),
                        );
                      });
                }),
          ),
        ),
      ),
    );
  }
}
