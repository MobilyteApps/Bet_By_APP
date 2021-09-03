import 'package:flutter/material.dart';
class UIConstants
{
  static final letYouSignIn = "Let's Sign You In.";
  static final welcomeBack = "Welcome Back.";
  static final goodToSee = "Good to see you again!";
  static final doNotHaveAccount="Don't have an Account?";
  static final createAnAccount="Create an Account";
  static final agreePolicyStatement_1="Yes, I agree to the";
  static final agreePolicyStatement_2="Terms and Conditions";
  static final agreePolicyStatement_3="and to the";
  static final agreePolicyStatement_4="Privacy Policy";
  static final alreadyHaveAccount="Already have an account?";
  static final forgotPassword="Forgot Password";
  static final forgotPasswordDescription="Enter the mail associated with your account and we'll send you an email with instructions to reset your password.";
  static final newPassword="New Password";
  static final newPasswordDescription="Your new password must be different from previously user passwords.";
  static final List<String> welcomeScreenText=
  [
    "Lorem ipsum dolor sit amet. Et sunt quibusdam sit voluptatem voluptas qui quis galisum est totam ipsum et fuga cupiditate et nihil facilis qui ullam veritatis. Et officia sapiente id beatae adipisci non sunt modi qui possimus eius.Est explicabo autem ut nobis voluptate ut nihil blanditiis sit laborum asperiores!",
    "Lorem ipsum dolor sit amet. Et sunt quibusdam sit voluptatem voluptas   nihil facilis qui ullam veritatis.Est explicabo autem ut nobis voluptate ut nihil blanditiis sit laborum asperiores!",
    "Lorem ipsum dolor sit amet. Et sunt quibusdam sit voluptatem voluptas qui qupiditatfficia non sunt modi qui possimus eius.",
    "Lorem ipsum dolor sit amet. Et sunt quibusdam sit voluptatem voluptas qui qui"
  ];

  static Widget backGroundImage()=>Container(constraints: BoxConstraints.expand(),child: Image(image: AssetImage('assets/images/sign_in_image.png'),fit: BoxFit.cover,));

  // static Widget welcomeScreenDots(Color? color)
  // {
  //   return Container(
  //     margin: EdgeInsets.only(top: height * .03,right: width * .0214),
  //     width: width * .03,
  //     height: height * .03,
  //     decoration: BoxDecoration(
  //         shape: BoxShape.circle,
  //         color: Colors.white
  //     ),
  //   );
  // }
}