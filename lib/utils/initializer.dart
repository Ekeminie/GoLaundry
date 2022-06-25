import 'package:anywash/constant/constants.dart';
import 'package:anywash/core/model/cleaning_transaction_history.dart';
import 'package:anywash/core/model/laundry_transaction_history.dart';
import 'package:anywash/core/services/booking_service.dart';
import 'package:anywash/core/services/web-services/user-api-service.dart';
import 'package:anywash/locator.dart';

import '../core/services/storage-service.dart';
import '../core/services/user.service.dart';

class Initializer {
  UserService userService = getIt<UserService>();
  StorageService storageService = getIt<StorageService>();

  initialCalls() async {
    String? value = await storageService.readItem(key: token);
    if (value != null && value.isNotEmpty) {
      await Future.wait(<Future>[
        getIt<UserApiService>().getUser(),
        getIt<BookingService>().getInitialItems(),
        getTransactionHistory(),
        getUserCalls(),
      ]);
    }
  }

  // get @UserTransaction History
  getTransactionHistory() async {
    String? laundry =
        await getIt<UserApiService>().getTransactions(serviceCode: 'LNDRY');
    String? clean =
        await getIt<UserApiService>().getTransactions(serviceCode: 'CLEAN');
    userService.cleaningTransactionHistory =
        cleaningTransHistoryFromMap((clean!));
    userService.laundryTransactionHistory =
        laundryTransHistoryFromMap(laundry!);
    print("cleaning: ${userService.cleaningTransactionHistory.data?.length}");
    print("laundry: ${userService.laundryTransactionHistory.data?.length}");
  }

  getUserCalls() async {
    await getIt<UserService>().getUser();
  }
}
