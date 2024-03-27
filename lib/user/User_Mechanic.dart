
import 'package:breakdown_assist/user/user_mechanic_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 class USER_MECHANIC extends StatefulWidget {
   const USER_MECHANIC({super.key});


   @override
   State<USER_MECHANIC> createState() => _USER_MECHANICState();
 }

 class _USER_MECHANICState extends State<USER_MECHANIC> {
   //
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
         child: Center(
           child: Column(
             children: [
               SizedBox(
                 height: 10,
               ),

               Container(
                 height: 850,
                 width: 470,
                 child: FutureBuilder(
                   future: FirebaseFirestore.instance.collection('mechsignup').where('status',isEqualTo: 1).get(),
                   builder: (context,snapshot) {
                     if (snapshot.connectionState == ConnectionState.waiting) {
                       return const Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                     if (snapshot.hasError) {
                       return Text('Error${snapshot.error}');
                     }
                     final mech=snapshot.data?.docs ??[];

                     return ListView.separated(
                         separatorBuilder: (context, index) =>
                             Divider(

                               color: Colors.white,
                               thickness: 2,
                               height: 20,
                             ),
                         itemCount: mech.length,
                         itemBuilder: (BuildContext context, int index) {
                           return
                             InkWell(
                               onTap: (){
                                 Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) => User_Mech_Detail(id: mech[index].id,)),
                                 );
                               },
                               child: Container(
                                 decoration: BoxDecoration(
                                   color: Colors.orange.shade50
                                 ),

                                 height: 100,
                                 width: 200,


                                 child: Row(

                                   mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.center,


                                   children: [
                                     SizedBox(
                                         height: 70,
                                         width: 70,
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment
                                               .center,
                                           crossAxisAlignment: CrossAxisAlignment
                                               .center,
                                           children: [
                                             CircleAvatar(
                                               backgroundImage: AssetImage(
                                                   "assets/images/men.png"),
                                               radius: 25,
                                             ),
                                             Row(
                                               children: [
                                                 SizedBox(
                                                   width:10 ,
                                                 ),
                                                 Text(mech[index]['username'], style: TextStyle(
                                                     fontSize: 12,
                                                     fontWeight: FontWeight.bold,
                                                     color: Colors.black),),
                                               ],
                                             )
                                           ],
                                         )),
                                     SizedBox(
                                       width: 30,
                                     ),
                                     Column(
                                       mainAxisAlignment: MainAxisAlignment
                                           .center,
                                       crossAxisAlignment: CrossAxisAlignment
                                           .center,
                                       children: [
                                         Text(mech[index]['experience'],
                                           style: TextStyle(
                                               fontWeight: FontWeight.bold),),
                                         Text("Fuel leaking", style: TextStyle(
                                             fontWeight: FontWeight.bold),),

                                         Padding(
                                           padding: const EdgeInsets.only(
                                               left: 20),
                                           child: ElevatedButton(onPressed: () {},
                                             child: Text("Available"),
                                             style: ElevatedButton.styleFrom(
                                               foregroundColor: Colors.white,
                                                 shape: RoundedRectangleBorder(
                                                     borderRadius: BorderRadius
                                                         .circular(2)
                                                 ),
                                                 backgroundColor: Colors.green
                                             ),
                                           ),
                                         ),
                                       ],
                                     )
                                   ],

                                 ),

                               ),
                             );
                         }


                     );
                   }
                 ),



               )
             ],
           ),
         ),
       ),


     );
   }
 }

