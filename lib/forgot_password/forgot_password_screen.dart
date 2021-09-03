import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_screens/ui_all_constants/ui_constants.dart';

class ForgotPassword extends StatelessWidget
{
  //const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    dynamic height=MediaQuery.of(context).size.height;
    dynamic width=MediaQuery.of(context).size.width;
    final Color customWhiteColor=Colors.white;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: TextButton.icon(onPressed: ()=>Get.toNamed('/'), icon: Icon(Icons.arrow_back,color: customWhiteColor), label: Text('')),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      //Read Structure for Build Here.
      /*
      Structure of body in build:
      Stack contains - Common Image, Column

        Common-> backgroundImage in ui_constants.dart

        Column -> 1 Container, 2 Center and 1 Padding :
          1st Container->Text for Forgot Password
          2nd Padding-> contains 1 Row
            Row -> 1 Flexible child for Forgot Password.
         3rd Center-> contains Container -> TextField for Email.
         4th Center -> Gesture Detector -> Container-> Text for Reset Password.
       */

      body: Stack(
        children: <Widget>[
          UIConstants.backGroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: height * .2,left: width * .06,bottom: height * .03),
                child: Text("${UIConstants.forgotPassword}",style: TextStyle(fontSize: height * .0281,color: customWhiteColor,fontWeight: FontWeight.bold)),
              ), //CrossAxisAlignment.start works Here only
              Padding(
                padding: EdgeInsets.only(left: width * .06,right: width * .04),
                child: Row(
                  children: [
                    Flexible(
                        child: Text("${UIConstants.forgotPasswordDescription}",maxLines: 4,style: TextStyle(color: customWhiteColor,fontSize: height * .0224),)),
                  ],
                ),
              ),
              Center(
                child: Container(
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
                      hintText: "Email Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: (){Get.toNamed('/setNewPassword');},
                  child: Container(
                    margin: EdgeInsets.only(top: height * .03),
                    alignment: Alignment.center,
                    width: width * .9,
                    height: height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.deepOrange,
                    ),
                    child: Text("Reset Password",style: TextStyle(fontSize: height * .0241,color: customWhiteColor)),  //ft=22 mobile Pixel 4A.
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
