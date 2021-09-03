import 'package:flutter/material.dart';
import 'package:sign_in_screens/ui_all_constants/ui_constants.dart';
class MainActivityScreen extends StatelessWidget
{
  //const MainActivityScreen({Key? key}) : super(key: key);
  final Color customWhiteColor=Colors.white;
  final List<Choose> choicesAvailable=
  [
    Choose('Create a',null,'New Bet','assets/images/create_new_bet_image.png',Color(0xFFFFC562),.07,.125),
    Choose('Bet I',null,'Created', 'assets/images/user_created_bet_image.png',Color(0xFFFF6D74),.07,.16),
    Choose('Invitations I',null,'Received','assets/images/invitation_user_image.png',Color(0xFF1FCB96),.07,.14),
    Choose('Bets for which I am','a','Participant','assets/images/user_bet_participation_image.png', Color(0xFF41A5FF),.07,.14),
    Choose('Bets for which','I am a', 'Referee', 'assets/images/user_bet_referee_image.png', Color(0xFF9E73FB),.07,.14),
    Choose('Bets for which','I am a', 'Closer','assets/images/bets_closer_image.png', Color(0xFFD660FF),.07,.1)
  ];

  @override
  Widget build(BuildContext context)
  {
    dynamic height=MediaQuery.of(context).size.height;
    dynamic width=MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Alexa's Dashboard",style: TextStyle(color: customWhiteColor)),
        centerTitle: true,
        leading: TextButton.icon(onPressed: (){}, icon: Icon(Icons.menu,color: customWhiteColor,), label: Text('')),
      ),
      body: Stack(
        children: <Widget>[
          UIConstants.backGroundImage(),
          GridView.count(
            padding: EdgeInsets.only(top: height * .2,left: width * .05,right: width * .05),
            crossAxisCount: 2,
            mainAxisSpacing: width *.05,
            crossAxisSpacing: width *.05,
            primary: false,
            children: List.generate(6, (index) => GestureDetector(child: SelectCard(choicesAvailable[index]),onTap: (){})), // on click TODO
          )
        ],
      ),
    );
  }

}

class SelectCard extends StatelessWidget
{
  late final Choose choice;
  SelectCard(this.choice);

  @override
  Widget build(BuildContext context)
  {
    dynamic height=MediaQuery.of(context).size.height;
    dynamic width=MediaQuery.of(context).size.width;
    final Color customWhiteColor=Colors.white;

    print("********* $height");
    return
        Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: choice.color,
            borderRadius: BorderRadius.circular(height * .0332),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: height * .035,
                    width: height * .035,
                    margin: EdgeInsets.only(top: height * .0179,right: width * .0357),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      color: choice.color,
                      border: Border.all(color: customWhiteColor,width: 1.6)
                    ),
                    child: Center(child: Text("10",style: TextStyle(fontSize: height * .0204,color: customWhiteColor))),  //make thi Obx TODO
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: height * .001,left: width * .05),
                  width: width * choice.widthFactor,
                  height: height * choice.heightFactor,
                  child: Image(image: AssetImage('${choice.imagePath}')
                  )
              ),
              Padding(
                padding: EdgeInsets.only(left: width * .05,top: height * .02),
                child: Text('${choice.upperLineText}',style: TextStyle(fontSize: height * .018,color: customWhiteColor)),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * .05),
                child: RichText(
                  text: TextSpan(
                    children: [
                      (choice.belowLineSmallText!=null) ? TextSpan(text: '${choice.belowLineSmallText}',style: TextStyle(fontSize: height * .018,color: customWhiteColor)):TextSpan(),
                      (choice.belowLineSmallText==null) ? TextSpan(text: '${choice.belowLineLargeText}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: height * .023,color: customWhiteColor)) : TextSpan(text: ' ${choice.belowLineLargeText}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: height * .025,color: customWhiteColor))
                    ]
                  ),
                ),
              )
            ],
          ),
        );
  }
}

class Choose
{
  late final String? upperLineText;
  late final String? belowLineSmallText;
  late final String? belowLineLargeText;
  late final String? imagePath;
  late final Color color;
  late final double? heightFactor;
  late final double? widthFactor;

  Choose(this.upperLineText,this.belowLineSmallText,this.belowLineLargeText,this.imagePath,this.color,this.heightFactor,this.widthFactor);

}
