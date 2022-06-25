import 'package:anywash/ui/base.vm.dart';

import '../widgets/custom_messages.dart';

class WelcomeViewModel extends BaseViewModel {
  String? phoneNumber;
  String? isoCode;

  setIsoCode(String? iso) {
    isoCode = iso;
    notifyListeners();
  }

  setPhone(String? phone) {
    phoneNumber = phone;
    notifyListeners();
  }

  bool get isValidEntries => phoneNumber != null && phoneNumber!.length > 10
      //     &&
      // isoCode != null &&
      // isoCode!.isNotEmpty
      ;

  showErrorMessage() {
    showCustomToast("Please enter a valid phone Number");
  }
}
