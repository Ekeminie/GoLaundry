import 'package:anywash/core/enum/viewState.enum.dart';
import 'package:anywash/core/model/res_model.dart';
import 'package:anywash/core/services/web-services/auth.api.dart';
import 'package:anywash/locator.dart';
import 'package:anywash/routes/routes.dart';
import 'package:anywash/ui/base.vm.dart';
import 'package:anywash/utils/initializer.dart';
import 'package:anywash/widgets/custom_messages.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends BaseViewModel {
  AuthenticationApiService auth = getIt<AuthenticationApiService>();
  String pin = "";

  String phoneNumber = "";
  String? isoCode;

  setIsoCode(String? iso) {
    isoCode = iso;
    notifyListeners();
  }

  setPhone(String phone) {
    phoneNumber = phone;
    notifyListeners();
  }

  TextEditingController phoneController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  bool get hasPhone => phoneNumber.isNotEmpty && phoneNumber.length > 9;
  bool get hasPin =>
      pinController.text.isNotEmpty && pinController.text.length > 2;

  LoginViewModel() {
    pinController.text = " ******";

    print(phoneNumber);
    notifyListeners();
  }

  setPin(String? v) {
    pin = v!;
    notifyListeners();
  }

  bool get isValidEntries => hasPin && hasPhone;

  showErrorMessage() {
    if (!hasPin) {
      showCustomToast("Please enter a valid pin");
    } else {
      showCustomToast("Please enter a valid phone number");
    }
  }

  loginUser() async {
    viewState = ViewState.busy;

    print("$phoneNumber $pin");
    ResModel res = await auth.login(phone: phoneNumber, pin: pin);
    if (res.success!) {
      await getIt<Initializer>().initialCalls();
      viewState = ViewState.idle;
      showCustomToast(res.message!, success: true);
      navigationService.navigateTo(PageRoutes.homePage);
    } else {
      viewState = ViewState.idle;
      showCustomToast(res.message!);
    }
  }
}
