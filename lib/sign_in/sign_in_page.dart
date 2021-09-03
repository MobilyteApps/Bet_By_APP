import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_screens/getx_controllers/getx_sign_in_controller.dart';
import 'package:sign_in_screens/ui_all_constants/ui_constants.dart';

class SignInPage extends StatelessWidget
{
  //const SignINPage({Key? key}) : super(key: key);

  final SignInFormX signInFormXController=Get.put(SignInFormX());
  final Color customWhiteColor=Colors.white;
  final Color customOrangeColor=Color(0xFFFF744E);

  //Read Structure for Build Here.
  /*
      Structure of body in build:
      Stack contains - Common Image, Column, Positioned Widget (connected to bottom)

        Common-> backgroundImage in ui_constants.dart

        Column -> 3 Containers and 1 Column :
          1st Container->Text for letYouSignIn
          2nd Container->Text for welcomeBack
          3rd Container->Text for goodToSee
          4th Column -> 2 Containers, 2 Obx, 1 Row, 1 GestureDetector :
            1st Container-> TextField For Email/UserName.
            2nd Obx-> Obx Error Text For TextField
            3rd Container-> TextField For Password.
            4th Obx-> Obx Error Text For Password.
            5th Row-> one child:
                        TextButton For Forgot Password.
            6th Gesture Detection-> For Sign Up.
        Positioned Widget contains 1 Row:
           Row-> 1 text for do not have account, 1 TextButton for Sign Up Now
       */

  @override
  Widget build(BuildContext context)
  {
    dynamic height=MediaQuery.of(context).size.height;
    dynamic width=MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          UIConstants.backGroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: height * .2,left: width * .08),
                child: Text("${UIConstants.letYouSignIn}",style: TextStyle(fontSize: height * .0281,color: customWhiteColor,fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(top: height * .028,left: width * .08),
                child: Text("${UIConstants.welcomeBack}",style: TextStyle(fontSize: height * .0256,color: customWhiteColor)),
              ),
              Container(
                margin: EdgeInsets.only(top: height * .0078,left: width * .08),
                child: Text("${UIConstants.goodToSee}",style: TextStyle(fontSize: height * .0256,color: customWhiteColor)),
              ),
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: customWhiteColor,
                    ),
                    width: width * .9,
                    margin: EdgeInsets.only(top: height * .04),
                    child: TextField(
                      style: TextStyle(fontSize: height * .0244),
                      onChanged: (value)=>signInFormXController.checkUserName(value),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: width * .05,top: height * .02,bottom: height * .02),
                        hintText: "Email or Username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  Obx(()
                  {
                    if(signInFormXController.usernameErrorText.value==null)
                      return Text('');
                    else
                      return Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: width * .05,top: height * .01),
                          child: Text('${signInFormXController.usernameErrorText.value}',style: TextStyle(color: Colors.red.shade200),));
                  }),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: customWhiteColor,
                    ),
                    margin: EdgeInsets.only(top: height * .005),
                    width: width * .9,
                    child: Obx(()
                    {
                      return
                        TextField(
                          style: TextStyle(fontSize: height * .0244),
                          onChanged: (value)=>signInFormXController.checkPassword(value),
                          obscureText: signInFormXController.obscurePassword.value,
                          // obscuringCharacter: "",
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: width * .05,top: height * .02,bottom: height * .02),
                              hintText: "Password",
                              errorStyle: TextStyle(),
                              suffixIcon: TextButton.icon(onPressed:(){signInFormXController.obscurePassword.value=!signInFormXController.obscurePassword.value;}, icon: Icon(Icons.visibility_sharp,color: Colors.black26,), label: Text('')),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                        );
                    }),
                  ),
                  Obx(()
                  {
                    if(signInFormXController.passwordErrorText.value==null)
                      return Text('');
                    else
                      return Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: width * .05,top: height * .01),
                          child: Text('${signInFormXController.passwordErrorText.value}',style: TextStyle(color: Colors.red.shade200),));
                  }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * .0, right: width * .05),
                        child: TextButton(
                            onPressed: ()=>Get.toNamed('/forgotPassword'),
                            child: Text("Forgot Password?",style: TextStyle(fontSize: height * .0204,color: customWhiteColor)
                            )
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: ()=>Get.toNamed('/welcomeScreen'),
                    child: Container(
                      margin: EdgeInsets.only(top: height * .01),
                      alignment: Alignment.center,
                      width: width * .9,
                      height: height * .08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: customOrangeColor,
                      ),
                      child: Text("Sign in",style: TextStyle(fontSize: height * .0241,color: customWhiteColor)),  //ft=22 mobile Pixel 4A.
                    ),
                  )
                ],
              ),
            ],
          ),
          Positioned(
            bottom: height * .0252,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${UIConstants.doNotHaveAccount}",style: TextStyle(fontSize: height * .0224, color: customWhiteColor)),
                TextButton(
                    child: Text(
                        'SignUp',
                        style: TextStyle(
                          fontSize: height * .0224,
                          color: customWhiteColor,
                        )
                    ),
                    onPressed: ()=>Get.toNamed('/signUp')
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}