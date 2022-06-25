import 'package:anywash/core/model/book_laundry_service_payload.dart';
import 'package:anywash/core/model/branch_response.dart';
import 'package:anywash/core/model/cleaning_service_payload.dart';
import 'package:anywash/core/model/delivery_options.dart';
import 'package:anywash/core/model/price_response.dart';
import 'package:anywash/core/model/service_category_response.dart';
import 'package:anywash/core/model/service_response.dart';
import 'package:anywash/core/services/web-services/service-api-service.dart';
import 'package:anywash/locator.dart';

class BookingService {
  ServicesApiService service = getIt<ServicesApiService>();
  ServicesResponse servicesResponse = ServicesResponse();
  BranchResponse branchResponse = BranchResponse();
  DeliverOptionsResponse deliverOptionsResponse = DeliverOptionsResponse();
  PriceResponse priceResponse = PriceResponse();
  ServicesCategoryResponse servicesCategoryResponse =
      ServicesCategoryResponse();
  ServiceCategory selectedServiceCategory = ServiceCategory();
  DeliveryOptions selectedDeliveryOption = DeliveryOptions();

  Branch? selectedBranch;
  Service? selectedService;

  bool get isLaundry => selectedService?.serviceName == "Laundry";

  getInitialItems() async {
    servicesResponse = await service.getServices();
    branchResponse = await service.getBranches();
    deliverOptionsResponse = await service.getDeliveryOptions();
    priceResponse = await service.getPrices();
  }

  String? paymentMethod;
  //Payload object  for orders
  BookLaundryServicePayload laundryServicePayload = BookLaundryServicePayload();
  BookCleaningServicePayload cleaningServicePayload =
      BookCleaningServicePayload();

  num? total;
}
