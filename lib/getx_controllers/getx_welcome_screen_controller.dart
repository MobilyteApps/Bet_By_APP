
import 'package:get/get.dart';
import 'package:sign_in_screens/ui_all_constants/ui_constants.dart';

class WelcomeScreenGetX extends GetxController
{
  List<String> welcomeScreenText=[];
  RxInt dotSelectedIndex=0.obs;
  bool flagForNextPage=false;
  void incrementIndex()=>(dotSelectedIndex<3) ? dotSelectedIndex++ : flagForNextPage=!flagForNextPage;

  @override
  void onInit()
  {
    super.onInit();
    addTextToList();
  }
  void addTextToList()
  {
    for(int i=0;i<=3;i++)
      welcomeScreenText.add(UIConstants.welcomeScreenText[i]);
  }
}