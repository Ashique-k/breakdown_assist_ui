import 'package:flutter/material.dart';
 class USER_MECHANIC extends StatefulWidget {
   const USER_MECHANIC({super.key});
 
   @override
   State<USER_MECHANIC> createState() => _USER_MECHANICState();
 }
 
 class _USER_MECHANICState extends State<USER_MECHANIC> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.white,
       body: SingleChildScrollView(
         child: Center(
           child: Column(
             children: [

               Container(
                 height: 850,
                 width: 470,
                 child: ListView.separated(
                     separatorBuilder: (context,index)=>Divider(

                       color:Colors.grey ,
                       thickness: 2,
                       height: 30,
                     ),
                     itemCount: 3,
                     itemBuilder: (BuildContext context,int index){
                       return
                         Container(

                           height: 100,
                           width: 200,


                           child: Row(

                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.center,


                             children: [
                               SizedBox(
                                   height:70,
                                   width: 70,
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       CircleAvatar(
                                         backgroundImage: AssetImage("assets/images/men.png"),
                                         radius: 20,
                                       ),
                                       Text("Name",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Colors.black),)
                                     ],
                                   )),
                               SizedBox(
                                 width: 20,
                               ),
                               Column(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Text("+2 year experience",style: TextStyle(fontWeight: FontWeight.bold),),
                                   Text("Fuel leaking",style: TextStyle(fontWeight: FontWeight.bold),),

                                   Padding(
                                     padding: const EdgeInsets.only(left: 20),
                                     child: ElevatedButton(onPressed: (){}, child: Text("Available"),
                                     style: ElevatedButton.styleFrom(
                                       backgroundColor: Colors.green
                                     ),
                                     ),
                                   ),
                                 ],
                               )
                             ],

                           ),

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

 