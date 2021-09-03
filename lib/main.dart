import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_screens/forgot_password/forgot_password_screen.dart';
import 'package:sign_in_screens/forgot_password/set_new_password_screen.dart';
import 'package:sign_in_screens/main_activity/main_activity_screen.dart';
import 'package:sign_in_screens/sign_in/sign_in_page.dart';
import 'package:sign_in_screens/sign_up/sign_up_page.dart';
import 'package:sign_in_screens/welcome/welcome_screen.dart';


void main()
{

  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page:()=>SignInPage()),
        GetPage(name: '/signUp', page:()=>SignUpPage()),
        GetPage(name: '/forgotPassword', page: ()=>ForgotPassword()),
        GetPage(name: '/setNewPassword', page: ()=>SetNewPassword()),
        GetPage(name: '/welcomeScreen', page: ()=>WelcomeScreen()),
        GetPage(name: '/mainActivityScreen', page: ()=>MainActivityScreen())
      ],
    ),
  );
}


