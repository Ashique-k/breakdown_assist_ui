import 'package:breakdown_assist/admin/admin_sign.dart';
import 'package:breakdown_assist/mechanic/mech_login.dart';
import 'package:breakdown_assist/user/User_Login.dart';
import 'package:flutter/material.dart';
class ADMIN_LOGIN extends StatefulWidget {
  const ADMIN_LOGIN({super.key});

  @override
  State<ADMIN_LOGIN> createState() => _ADMIN_LOGINState();
}

class _ADMIN_LOGINState extends State<ADMIN_LOGIN> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: Colors.orange.shade300,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                  height: 300,
                  width: 300,

                  child: Image.asset("assets/images/breakdowncar.jpg")),
              SizedBox(
                height: 40,
              ),
              Text("Who You Are ?",style: TextStyle(fontSize: 20,color: Colors.black),),
              SizedBox(
                height: 50,

              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MECH_LOGIN()),
                  );


                }, child: Text("Mechanic",style: TextStyle(fontSize: 18,color: Colors.black),),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                ),
              ),
              SizedBox(
                height: 20,

              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const USER_LOGIN()),
                  );

                }, child: Text("User",style: TextStyle(fontSize: 18,color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ADMIN_SIGN()),
              );


            }, child: Text("Admin Login",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),))


            ],
          ),
        ),
      ),
    );
  }
}
