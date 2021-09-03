import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_screens/getx_controllers/getx_signup_controller.dart';
import 'package:sign_in_screens/ui_all_constants/ui_constants.dart';
import 'package:custom_check_box/custom_check_box.dart';

class SignUpPage extends StatelessWidget
{

  final Color customWhiteColor=Colors.white;
  final Color customOrangeColor=Color(0xFFFF744E);
  final SignUpFormX signUpGetXController=Get.put(SignUpFormX());


  @override
  Widget build(BuildContext context)
  {
    dynamic height=MediaQuery.of(context).size.height;
    dynamic width=MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      //Read Structure for Build Here.
      /*
      Structure of body in build:
      Stack contains - Common Image, Column, Positioned Widget (connected to bottom)

        Common-> backgroundImage in ui_constants.dart

        Column -> 1 Container, 2 Center and 1 Padding :
          1st Container->Text for CreateAccount
          2nd Center-> contains 1 Column  // Use for Center is Required Parent Column Main axis is Start.
            Column-> 4 Containers
              1st Container->TextField For UserName
              2nd Container->TextField For Password
              3rd Container->TextField For Confirm Password.
              4th Container->TextField For Email(Optional)
          3rd Padding-> Contains Row
            Row-> 1 Obx and 1 Flexible
              1 Obx -> Custom check Box
              1 Flexible -> 1 RichText->(4 TextSpan for Privacy Policy)
          4th  Center ->  Gesture Detector -> for Sign Up field.
        Positioned Widget contains 1 Row:
           Row-> 1 text for already have account, 1 TextButton for Sign In Now
       */

      body: Stack(
        children: <Widget>[
          UIConstants.backGroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: height * .15,left: width * .06),
                child: Text("${UIConstants.createAnAccount}",style: TextStyle(fontSize: height * .0281,color: customWhiteColor,fontWeight: FontWeight.bold)),
              ), //CrossAxisAlignment.start works Here
              Center(
                child: Column(
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
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: width * .05,top: height * .02,bottom: height * .02),
                          hintText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: customWhiteColor,
                      ),
                      margin: EdgeInsets.only(top: height * .025),
                      width: width * .9,
                      child: TextField(
                        style: TextStyle(fontSize: height * .0244),
                        // obscuringCharacter: "",
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: width * .05,top: height * .02,bottom: height * .02),
                            hintText: "Password",
                            errorStyle: TextStyle(),
                            suffixIcon: TextButton.icon(onPressed:(){}, icon: Icon(Icons.visibility_sharp,color: Colors.black26,), label: Text('')),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: customWhiteColor,
                      ),
                      margin: EdgeInsets.only(top: height * .025),
                      width: width * .9,
                      child: TextField(
                        style: TextStyle(fontSize: height * .0244),
                        // obscuringCharacter: "",
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: width * .05,top: height * .02,bottom: height * .02),
                            hintText: "Confirm Password",
                            errorStyle: TextStyle(),
                            suffixIcon: TextButton.icon(onPressed:(){}, icon: Icon(Icons.visibility_sharp,color: Colors.black26,), label: Text('')),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: customWhiteColor,
                      ),
                      width: width * .9,
                      margin: EdgeInsets.only(top: height * .025),
                      child: TextField(
                        style: TextStyle(fontSize: height * .0244),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: width * .05,top: height * .02,bottom: height * .02),
                          hintText: "Email(Optional)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * .025,left: height * .0101,right: height * .0101,bottom: height * .0101),
                child: Row(
                  children: <Widget>[
                    Obx(()
                    {
                      return  CustomCheckBox(
                        value: signUpGetXController.policyCheck.value,
                        onChanged: (value){signUpGetXController.policyCheck.value=value;},
                        checkBoxSize: height * .0244,
                        borderRadius: height * .0244,
                        borderColor: customWhiteColor,
                        checkedFillColor: customWhiteColor,
                        checkedIconColor: Colors.black,
                      );
                    }),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.0150),
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              TextSpan(text: '${UIConstants.agreePolicyStatement_1} ', style: TextStyle(fontSize: height * .0224)),
                              TextSpan(text: '${UIConstants.agreePolicyStatement_2}', style: TextStyle(decoration: TextDecoration.underline,fontSize: height * .0224),),  // perform onEnter TODO
                              TextSpan(text: ' ${UIConstants.agreePolicyStatement_3} ', style: TextStyle(fontSize: height * .0224)),
                              TextSpan(text: '${UIConstants.agreePolicyStatement_4}.', style: TextStyle(decoration: TextDecoration.underline,fontSize: height * .0224)), // perform onEnter TODO
                            ]
                          )
                        ),
                      ),
                    ),
                    //Padding(padding: EdgeInsets.only(right: width * .05))
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: height * .02),
                    alignment: Alignment.center,
                    width: width * .9,
                    height: height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: customOrangeColor,
                    ),
                    child: Text("Sign Up",style: TextStyle(fontSize: height * .0241,color: customWhiteColor)),  //ft=22 mobile Pixel 4A.
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: height * .0252,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("${UIConstants.alreadyHaveAccount}",style: TextStyle(fontSize: height * .0224, color: customWhiteColor)),
                TextButton(
                    child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: height * .0224,
                          color: customWhiteColor,
                        )
                    ),
                    onPressed: ()=>Get.toNamed('/')
                )
              ],
            ),
          ),
        ],

      ),
    );
  }

}