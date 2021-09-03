import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_in_screens/getx_controllers/getx_welcome_screen_controller.dart';
import 'package:sign_in_screens/ui_all_constants/ui_constants.dart';

class WelcomeScreen extends StatelessWidget
{
  //const Welcome({Key? key}) : super(key: key);
  final WelcomeScreenGetX welcomeScreenGetXController=Get.put(WelcomeScreenGetX());
  final Color customWhiteColor=Colors.white;
  final Color customOrangeColor=Color(0xFFFF744E);


  //Read Structure for Build Here.
  /*
      Structure of body in build:
      Stack contains - Common Image, Column, Container, Positioned(attached To bottom), Positioned(attached To bottom)

        Common-> backgroundImage in ui_constants.dart

        Column -> 1 Container, 1 Text, 1 Obx.
          1st Container -> contains Welcome_ screen image.
          2nd Text for Welcome
          3rd Obx-> Flexible -> Padding-> Text for Welcome Screen.(max Lines:4)
        Container -> Row-> 4 Obx dots (Widget required coloredDots)
        Positioned -> Gesture Detector -> Container -> Text for Skip.
        Positioned -> Gesture Detector -> Container -> Text for Next.
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
            children: [
              Container(
                margin: EdgeInsets.only(top: height * .1),
                height: height * .4,
                width: width * .75,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/welcome_screen_image.png')
                  )
                ),
              ),
              Text("Welcome",style: TextStyle(fontSize: height * .04,color: customWhiteColor)),
              Obx(()
              {
                return Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(left: width * .035,right:  width * .035,top: height * .02),
                      child: Text(
                          "${UIConstants.welcomeScreenText[welcomeScreenGetXController.dotSelectedIndex.value]}",
                          maxLines:4,
                          style: TextStyle(
                              fontSize: height * .0214,
                              color:customWhiteColor
                          ),
                          textAlign: TextAlign.center
                      )
                  ),
                );
              }),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: height * .7),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(()
                {
                  if(welcomeScreenGetXController.dotSelectedIndex.value==0)
                  return coloredDots(customOrangeColor, height, width);
                  else
                    return coloredDots(customWhiteColor, height, width);
                }),
                Obx(()
                {
                  if(welcomeScreenGetXController.dotSelectedIndex.value==1)
                    return coloredDots(customOrangeColor, height, width);
                  else
                    return coloredDots(customWhiteColor, height, width);
                }),
                Obx(()
                {
                  if(welcomeScreenGetXController.dotSelectedIndex.value==2)
                    return coloredDots(customOrangeColor, height, width);
                  else
                    return coloredDots(customWhiteColor, height, width);
                }),
                Obx(()
                {
                  if(welcomeScreenGetXController.dotSelectedIndex.value==3)
                    return coloredDots(customOrangeColor, height, width);
                  else
                    return coloredDots(customWhiteColor, height, width);
                })
              ],
            ),
          ),
          Positioned(
            bottom: height * .13,
            left: width *.05,
            child: GestureDetector(
              onTap: ()=>Get.toNamed('/mainActivityScreen'),
              child: Container(
                alignment: Alignment.center,
                width: width * .9,
                height: height * .08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.transparent,
                ),
                child: Text("Skip",style: TextStyle(fontSize: height * .0241,color: customWhiteColor)),  //ft=22 mobile Pixel 4A.
              ),
            ),
          ),
          Positioned(
            bottom: height * .04,
            left: width *.05,
            child: GestureDetector(
                 onTap: ()
                 {
                   if(welcomeScreenGetXController.dotSelectedIndex.value<3 && welcomeScreenGetXController.flagForNextPage==false)
                     welcomeScreenGetXController.incrementIndex();
                   else
                     Get.toNamed('/mainActivityScreen'); //welcomeScreenGetXController.dotSelectedIndex.value=0;
                 },
                  child: Container(
                    alignment: Alignment.center,
                    width: width * .9,
                    height: height * .08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: customOrangeColor
                    ),
                    child: Text("Next",style: TextStyle(fontSize: height * .0241,color: customWhiteColor)),  //ft=22 mobile Pixel 4A.
                  ),
              ),
          )
        ],
      ),
    );
  }
  
  Widget coloredDots(Color? color,dynamic height,dynamic width)
  {
    return Container(
      margin: EdgeInsets.only(top: height * .03,right: width * .0214),
      width: width * .03,
      height: height * .03,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
      ),
    );
  }

}
