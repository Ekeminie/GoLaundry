import 'package:anywash/core/enum/viewState.enum.dart';
import 'package:anywash/core/model/res_model.dart';
import 'package:anywash/core/services/web-services/auth.api.dart';
import 'package:anywash/locator.dart';
import 'package:anywash/routes/routes.dart';
import 'package:anywash/ui/base.vm.dart';
import 'package:anywash/widgets/custom_messages.dart';
import 'package:flutter/cupertino.dart';

class RegistrationViewModel extends BaseViewModel {
  AuthenticationApiService auth = getIt<AuthenticationApiService>();
  String? phone;
  String? email;
  String? name;
  String? pin;
  String? fName;
  String? lName;

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  bool get hasFName =>
      fNameController.text.isNotEmpty && fNameController.text.length > 2;
  bool get hasLName =>
      lNameController.text.isNotEmpty && lNameController.text.length > 2;
  bool get hasPhone =>
      phoneController.text.isNotEmpty && phoneController.text.length > 2;
  bool get hasEmail =>
      emailController.text.isNotEmpty && emailController.text.length > 6;

  bool get hasPin =>
      pinController.text.isNotEmpty && pinController.text.length > 5;

  RegistrationViewModel() {
    pinController.text = " ******";
    phone = "\n ${userService.authPhone}";
    phoneController.text = phone!;
    notifyListeners();
  }
  String? phoneNumber;

  setPin(String? v) {
    pin = v!;
    print(pin);
    notifyListeners();
  }

  setPhone(String? v) {
    phone = "\n $v";
    notifyListeners();
  }

  setEmail(String? e) {
    email = e;
    notifyListeners();
  }

  setFName(String? v) {
    fName = "\n $v";
    notifyListeners();
  }

  setLName(String? v) {
    lName = "\n $v";
    notifyListeners();
  }

  bool get isValidEntries => hasPhone && hasEmail && hasFName && hasLName;

  showErrorMessage() {
    if (!hasLName) {
      showCustomToast("Please enter a valid first name");
    } else if (!hasLName) {
      showCustomToast("Please enter a valid last name");
    } else if (!hasEmail) {
      showCustomToast("Please enter a valid email");
    } else {
      showCustomToast("Please enter a valid phone number");
    }
    // else {
    //   showCustomToast("Please enter a valid pin");
    // }
  }

  save() {
    userService.regPayload =
        RegPayload(fName: fName, lName: lName, email: email, phone: phone);
  }

  registerUser() async {
    print("herer");

    viewState = ViewState.busy;
    ResModel res = await auth.signup(
        phone: userService.regPayload.phone,
        email: userService.regPayload.email,
        lName: userService.regPayload.lName,
        fName: userService.regPayload.fName,
        pin: pin);

    if (res.success!) {
      viewState = ViewState.idle;
      showCustomToast(res.message!, success: true);
      // Navigator.pushNamed(context, LoginRoutes.verification);
      navigationService.navigateTo(PageRoutes.loginNavigator);
    } else {
      viewState = ViewState.idle;
      showCustomToast(res.message!);
    }
  }
}

class RegPayload {
  final String? fName;
  final String? lName;
  final String? email;
  final String? phone;
  final String? pin;

  RegPayload({this.fName, this.lName, this.email, this.phone, this.pin});
}
