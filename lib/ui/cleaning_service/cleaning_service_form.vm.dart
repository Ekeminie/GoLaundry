import 'package:anywash/core/enum/viewState.enum.dart';
import 'package:anywash/core/model/book_service_response.dart';
import 'package:anywash/core/model/cleaning_service_payload.dart';
import 'package:anywash/core/services/web-services/service-api-service.dart';
import 'package:anywash/locator.dart';
import 'package:anywash/ui/base.vm.dart';
import 'package:anywash/widgets/custom_messages.dart';
import 'package:flutter/cupertino.dart';

class CleaningServiceViewModel extends BaseViewModel {
  BookCleaningServicePayload cleaningPayload = BookCleaningServicePayload();
  ServicesApiService service = getIt<ServicesApiService>();
  String? phone;
  String? email;
  String? name;
  String? pin;
  String? fName;
  String? lName;

  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();
  TextEditingController altPhoneNumberController = TextEditingController();

  bool get hasName =>
      nameController.text.isNotEmpty && nameController.text.length > 2;
  bool get hasAltPhone =>
      altPhoneNumberController.text.isNotEmpty &&
      altPhoneNumberController.text.length > 2;
  bool get hasPhone =>
      phoneController.text.isNotEmpty && phoneController.text.length > 2;
  bool get hasInstructions =>
      instructionsController.text.isNotEmpty &&
      instructionsController.text.length > 6;
  bool get hasDate =>
      dateController.text.isNotEmpty && dateController.text.length > 5;
  bool get hasAddress =>
      addressController.text.isNotEmpty && addressController.text.length > 5;

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

  bool get isValidEntries =>
      hasPhone &&
      hasAltPhone &&
      hasName &&
      hasAddress &&
      hasInstructions &&
      hasDate;

  showErrorMessage() {
    if (!hasName) {
      showCustomToast("Please enter a valid name");
    } else if (!hasAddress) {
      showCustomToast("Please enter a valid address");
    } else if (!hasDate) {
      showCustomToast("Please enter a valid date");
    } else if (!hasInstructions) {
      showCustomToast("Please enter some instructions for your order");
    } else if (!hasAltPhone) {
      showCustomToast("Please enter a valid alternative phone number");
    } else {
      showCustomToast("Please enter a valid phone number");
    }
  }

  sendRequest() async {
    viewState = ViewState.busy;
    cleaningPayload.serviceCode = bookingService.selectedService!.serviceCode;
    cleaningPayload.date = dateController.text;
    cleaningPayload.address = addressController.text;
    cleaningPayload.instruction = instructionsController.text;
    cleaningPayload.categoryId =
        int.tryParse(bookingService.selectedServiceCategory.categoryId ?? "");

    cleaningPayload.phoneNumber = int.parse(phoneController.text);
    cleaningPayload.altPhonenumber = int.parse(altPhoneNumberController.text);
    cleaningPayload.fullname = nameController.text;

    try {
      BookServiceResponse res =
          await service.bookCleaningService(payload: cleaningPayload);

      if (res.success == 1) {
        viewState = ViewState.idle;
        showCustomToast(res.message!, success: true);
        navigationService.navigateToReplace(PageRoutes.orderPlaced);
      } else {
        viewState = ViewState.idle;
        showCustomToast(res.message!);
      }
    } catch (e) {
      viewState = ViewState.idle;
      print(e.toString());
      showCustomToast(e.toString());
    }
  }

  setDate(DateTime date) {
    dateController.text = date.toIso8601String();
    notifyListeners();
  }
}
