import 'package:flutter/material.dart';
class Service_page extends StatefulWidget {
  const Service_page({super.key});

  @override
  State<Service_page> createState() => _Service_pageState();
}

class _Service_pageState extends State<Service_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:(){

          showDialog(context: context, builder: (BuildContext context)=>AlertDialog(

            backgroundColor: Colors.white,
            title: Text("Add service",style: TextStyle(fontWeight: FontWeight.bold),),
            content: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(


                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                ),


                height: 80,



                child: TextFormField(
                  maxLines: 2,
                  decoration: InputDecoration(


                      border: InputBorder.none

                  ),
                ),
              ),
            ),
            actions: [Center(
              child: SizedBox(
                height: 30,
                width: 150,
                child: ElevatedButton(onPressed: (){}, child: Text("Add"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
            )],
          ),);

        } ,child: Icon(Icons.add),),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text("Service",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 350,
              width: 370,
              child: Padding(
                padding: const EdgeInsets.only(left: 30,top: 70),
                child: Card(
                  color: Colors.blue.shade100,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text("Tyre puncture service"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black54,
                        height: 1,
                        width: 250,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text("Engine service"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black54,
                        height: 1,
                        width: 280,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text("A/C service"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 170),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.black54,
                        height: 1,
                        width: 280,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text("Electric service"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

            ),
          ],
        ),
      ),




    );
  }
}