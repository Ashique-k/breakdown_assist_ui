import 'package:breakdown_assist/firebase_options.dart';
import 'package:breakdown_assist/splash_screens.dart';
import 'package:breakdown_assist/user/Mech_failed_page.dart';
import 'package:breakdown_assist/user/User_Login.dart';
import 'package:breakdown_assist/user/User_Mechanic.dart';
import 'package:breakdown_assist/user/User_Mechanic_bill_page.dart';
import 'package:breakdown_assist/user/User_Request.dart';
import 'package:breakdown_assist/user/User_home.dart';
import 'package:breakdown_assist/user/User_notification.dart';
import 'package:breakdown_assist/user/User_payment_sucess.dart';
import 'package:breakdown_assist/user/User_profile.dart';
import 'package:breakdown_assist/user/User_sign_up_page.dart';
import 'package:breakdown_assist/user/user_mechanic_details.dart';
import 'package:breakdown_assist/user/user_rating_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'admin/ADMIN_MECH.dart';
import 'admin/ADMIN_USER.dart';
import 'admin/Admin_tab.dart';
import 'admin/admin_add_notification.dart';
import 'admin/admin_add_user.dart';
import 'admin/admin_home.dart';
import 'admin/admin_home_mechanic.dart';
import 'admin/admin_login.dart';
import 'admin/admin_notification.dart';
import 'admin/admin_payment.dart';
import 'admin/admin_sign.dart';
import 'mechanic/Mech_Home.dart';
import 'mechanic/Mech_Sign.dart';
import 'mechanic/Mech_Status.dart';
import 'mechanic/Mech_accepted_home.dart';
import 'mechanic/Mech_request_home.dart';
import 'mechanic/mech_accept_reject.dart';
import 'mechanic/mech_profile.dart';
import 'mechanic/mech_login.dart';
import 'mechanic/edit_mech_profile.dart';
import 'mechanic/mech_rating.dart';

import 'mechanic/mech_service_page.dart';
import 'mechanic/mech_tab.dart';
import 'mechanic/notification_mech.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Splash(),
    );
  }
}
