import 'package:anywash/core/model/delivery_options.dart';

import '../../routes/routes.dart';
import '../base.vm.dart';

class DeliveryOptionsViewModel extends BaseViewModel {
  DeliverOptionsResponse deliverOptionsResponse = DeliverOptionsResponse();
  DeliveryOptionsViewModel() {
    deliverOptionsResponse = bookingService.deliverOptionsResponse;
    notifyListeners();
  }

  selectDeliveryOption(DeliveryOptions s) {
    bookingService.selectedDeliveryOption = s;

    //add delivery fee to total
    bookingService.total = bookingService.total! + num.parse(s.deliveryPrice!);
    bookingService.laundryServicePayload.deliveryCode =
        int.parse(s.deliveryCode ?? "");
    bookingService.laundryServicePayload.deliveryCode == 5
        ? navigationService.navigateTo(PageRoutes.paymentMethod)
        : navigationService.navigateTo(PageRoutes.selectLocation);
  }
}
