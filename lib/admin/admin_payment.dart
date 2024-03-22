import 'package:flutter/material.dart';
class Admin_payment extends StatefulWidget {
  const Admin_payment({super.key});

  @override
  State<Admin_payment> createState() => _Admin_paymentState();
}

class _Admin_paymentState extends State<Admin_payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              Container(
                height: 900,
                width: 470,
                child: ListView.separated(
                    separatorBuilder: (context,index)=>Divider(
                      indent: 13,
                      endIndent: 35,
                      color:Colors.white ,
                      thickness: 5,
                      height: 50,
                    ),
                    itemCount: 10,
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
                                width: 18,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [ Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
                                      SizedBox(
                                        width: 200,
                                      ),
                                      Text("16/3/2024",style: TextStyle(fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  Text("6000/-",),
                                  Text("service"),
                                  Text("Mechanic name"),
                                ],
                              )
                            ],

                          ),

                        );
                    }


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
