import 'package:get/get.dart';

class SignInFormX extends GetxController
{
  RxString username=''.obs;
  RxString password=''.obs;
  RxnString usernameErrorText=RxnString(null);
  RxnString passwordErrorText=RxnString(null);
  RxBool obscurePassword=false.obs;

  @override
  void onInit()
  {
    super.onInit();
    //debounce(username, checkUserName,time: Duration(milliseconds: 500));

  }

  void checkUserName(String? currentUsername)
  {
    usernameErrorText.value=null;
    if(currentUsername!.isNotEmpty)
      if(currentUsername.length <5)
        usernameErrorText.value="Username Length Shorter than 5!";
  }

  void checkPassword(String? currentPassword)
  {
    passwordErrorText.value=null;
    if(currentPassword!.isNotEmpty)
      if(currentPassword.length <6)
        passwordErrorText.value="Password Length Shorter than 6";
  }

}

