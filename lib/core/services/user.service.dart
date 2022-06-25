import 'package:anywash/constant/constants.dart';
import 'package:anywash/core/model/cleaning_transaction_history.dart';
import 'package:anywash/core/model/laundry_transaction_history.dart';
import 'package:anywash/core/model/user_profile.dart';
import 'package:anywash/core/services/storage-service.dart';
import 'package:anywash/locator.dart';
import 'package:anywash/ui/auth/regisgter/register.vm.dart';

class UserService {
  UserProfile userCredentials = UserProfile();
  // User userCredentials = User();
  StorageService storageService = getIt<StorageService>();
  bool? _token;

  //get the user object
  getUser() async {
    String? userVal = await storageService.readItem(key: currentUser);
    if (userVal != null) userCredentials = userProfileFromMap(userVal);
    String? value = await storageService.readItem(key: token);
    _token = value != null ? true : false;
  }

  //check if a user has a token
  bool get hasToken => _token ?? false;

  String? authPhone;
  RegPayload regPayload = RegPayload();

  //clear all user credentials
  resetAllCredentials() {
    storageService.deleteItem(key: currentUser);
    storageService.deleteItem(key: token);
    _token = null;
  }

  //transaction history items
  CleaningTransactionHistory cleaningTransactionHistory =
      CleaningTransactionHistory();
  LaundryTransactionHistory laundryTransactionHistory =
      LaundryTransactionHistory();
}
