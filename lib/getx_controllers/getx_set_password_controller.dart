import 'package:get/get.dart';

class SetPasswordGetX extends GetxController
{
  RxString password=''.obs;
  RxString confirmPassword=''.obs;
  RxnString passwordErrorText=RxnString(null);
  RxnString confirmPasswordErrorText=RxnString(null);

  void checkPassword(String? currentPassword)
  {
    passwordErrorText.value=null;
    if(currentPassword!.isNotEmpty)
      if(currentPassword.length <9)
        passwordErrorText.value="Password needs to be at least 8 characters long.";
  }

  void matchPassword()
  {
    confirmPasswordErrorText.value=null;
    if(confirmPassword.isNotEmpty && password.value.isNotEmpty)
      if(confirmPassword.value!=password.value)
        confirmPasswordErrorText.value="Passwords Mismatches";
  }
}