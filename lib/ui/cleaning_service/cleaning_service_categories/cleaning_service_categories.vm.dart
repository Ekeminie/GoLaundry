import 'package:anywash/core/model/branch_response.dart';
import 'package:anywash/core/model/service_category_response.dart';
import 'package:anywash/core/services/web-services/service-api-service.dart';
import 'package:anywash/locator.dart';
import 'package:anywash/routes/routes.dart';
import 'package:anywash/ui/base.vm.dart';
import 'package:anywash/utils/loader.dart';

class CleaningServiceCategoriesViewModel extends BaseViewModel {
  ServiceCategory selectedServiceCategory = ServiceCategory();
  BranchResponse branchResponse = BranchResponse();
  ServicesCategoryResponse servicesCategory = ServicesCategoryResponse();
  CleaningServiceCategoriesViewModel() {
    branchResponse = bookingService.branchResponse;
    notifyListeners();
    // fetchCategoryService();
  }

  fetchCategoryService(context) async {
    showLoader(context);
    servicesCategory = await getIt<ServicesApiService>().getServiceCategory(
        serviceID: bookingService.selectedService?.serviceCode);
    bookingService.servicesCategoryResponse = servicesCategory;
    notifyListeners();
    hideLoader();
  }

  selectServiceCategory(ServiceCategory s) {
    bookingService.selectedServiceCategory = s;
    selectedServiceCategory = s;
    navigationService.navigateTo(PageRoutes.cleaningServicePage);
  }
}
