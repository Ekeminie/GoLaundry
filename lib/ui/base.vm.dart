import 'package:anywash/core/services/booking_service.dart';
import 'package:anywash/core/services/storage-service.dart';
import 'package:anywash/core/services/user.service.dart';
import 'package:anywash/locator.dart';
import 'package:flutter/foundation.dart';

import '../core/enum/viewState.enum.dart';
import '../core/services/navigation_service.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.idle;
  NavigationService navigationService = getIt<NavigationService>();
  UserService userService = getIt<UserService>();
  StorageService storageService = getIt<StorageService>();
  BookingService bookingService = getIt<BookingService>();

  ViewState get viewState => _viewState;

  set viewState(ViewState newState) {
    _viewState = newState;
    notifyListeners();
  }
}
