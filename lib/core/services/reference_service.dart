import 'package:anywash/locator.dart';

import 'user.service.dart';

class ReferenceService {
  var user = getIt<UserService>();
  String generateReference(int i) {
    var ref =
        "${user.userCredentials.data?.profile?.firstname!} ${user.userCredentials.data?.profile?.lastname} ${i == 0 ? "wallet" : "card"}- ${DateTime.now().toIso8601String()}";
    print(ref);
    return ref;
  }
}
