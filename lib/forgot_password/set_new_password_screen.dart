import 'package:flutter/material.dart';
import 'package:sign_in_screens/getx_controllers/getx_set_password_controller.dart';
import 'package:sign_in_screens/ui_all_constants/ui_constants.dart';
import 'package:get/get.dart';

class SetNewPassword extends StatelessWidget
{
  //const SetNewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    dynamic height=MediaQuery.of(context).size.height;
    dynamic width=MediaQuery.of(context).size.width;
    final Color customWhiteColor=Colors.white;
    final SetPasswordGetX setPasswordGetXController=Get.put(SetPasswordGetX());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          UIConstants.backGroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: height * .2,left: width * .06,bottom: height * .03),
                child: Text("${UIConstants.newPassword}",style: TextStyle(fontSize: height * .0281,color: customWhiteColor,fontWeight: FontWeight.bold)),
              ), //CrossAxisAlignment.start works Here only
              Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: width * .06)),
                  Flexible(
                      child: Text("${UIConstants.newPasswordDescription}",maxLines: 3,style: TextStyle(color: customWhiteColor,fontSize: height * .0224),)),
                  Padding(padding: EdgeInsets.only(right: width * .04)),
                ],
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
                    onChanged: (value)
                    {
                      setPasswordGetXController.password.value=value;
                      setPasswordGetXController.checkPassword(value);
                      setPasswordGetXController.matchPassword();
                    },
                    style: TextStyle(fontSize: height * .0244),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: width * .05,top: height * .02,bottom: height * .02),
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(()
              {
                if(setPasswordGetXController.passwordErrorText.value==null)
                  return Text('');
                else
                  return Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: width * .05,top: height * .015),
                      child: Text('${setPasswordGetXController.passwordErrorText.value}',style: TextStyle(color: customWhiteColor)));

              }),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: customWhiteColor,
                  ),
                  width: width * .9,
                  margin: EdgeInsets.only(top: height * .04),
                  child: TextField(
                    onChanged: (value)
                    {
                      setPasswordGetXController.confirmPassword.value=value;
                      setPasswordGetXController.matchPassword();
                    },
                    style: TextStyle(fontSize: height * .0244),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: width * .05,top: height * .02,bottom: height * .02),
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              Obx(()
              {
                if(setPasswordGetXController.confirmPasswordErrorText.value==null)
                  return Text('');
                else
                  return Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: width * .05,top: height * .015),
                      child: Text('${setPasswordGetXController.confirmPasswordErrorText.value}',style: TextStyle(color: customWhiteColor)));

              }),
              Center(
                child: GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(top: height * .03),
                    alignment: Alignment.center,
                    width: width * .9,
                    height: height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.deepOrange,
                    ),
                    child: Text("Change Password",style: TextStyle(fontSize: height * .0241,color: customWhiteColor)),  //ft=22 mobile Pixel 4A.
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
