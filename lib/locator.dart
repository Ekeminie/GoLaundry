import 'package:anywash/login_password/login.vm.dart';
import 'package:anywash/ui/auth/regisgter/register.vm.dart';
import 'package:anywash/ui/cleaning_service/cleaning_service_categories/cleaning_service_categories.vm.dart';
import 'package:anywash/ui/delivery_options/delivery_options.vm.dart';
import 'package:anywash/ui/welcome.vm.dart';
import 'package:anywash/utils/initializer.dart';
import 'package:get_it/get_it.dart';

import 'core/services/booking_service.dart';
import 'core/services/navigation_service.dart';
import 'core/services/storage-service.dart';
import 'core/services/user.service.dart';
import 'core/services/web-services/auth.api.dart';
import 'core/services/web-services/service-api-service.dart';
import 'core/services/web-services/user-api-service.dart';

GetIt getIt = GetIt.I;

dependenciesInjectorSetup() {
  //View Model
  getIt.registerFactory<WelcomeViewModel>(() => WelcomeViewModel());
  // getIt.registerFactory<AccountViewModel>(() => AccountViewModel());
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel());
  // getIt.registerFactory<HomeViewModel>(() => HomeViewModel());
  // getIt.registerFactory<ItemsViewModel>(() => ItemsViewModel());
  // getIt.registerFactory<CartViewModel>(() => CartViewModel());
  // getIt.registerFactory<WalletViewModel>(() => WalletViewModel());
  // getIt.registerFactory<CleaningHistoryViewModel>(
  //         () => CleaningHistoryViewModel());
  // getIt.registerFactory<LaundryHistoryViewModel>(
  //         () => LaundryHistoryViewModel());
  // getIt.registerFactory<CleaningServiceViewModel>(
  //         () => CleaningServiceViewModel());
  // getIt.registerFactory<SetLocationAndTimeViewModel>(
  //         () => SetLocationAndTimeViewModel());
  // getIt.registerFactory<PaymentPageViewModel>(() => PaymentPageViewModel());
  //
  // getIt.registerFactory<StoresViewModel>(() => StoresViewModel());
  getIt.registerFactory<DeliveryOptionsViewModel>(
      () => DeliveryOptionsViewModel());
  getIt.registerFactory<CleaningServiceCategoriesViewModel>(
      () => CleaningServiceCategoriesViewModel());
  getIt.registerFactory<RegistrationViewModel>(() => RegistrationViewModel());

  // Services
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton(() => Initializer());
  getIt.registerLazySingleton(() => UserService());
  getIt.registerLazySingleton<StorageService>(() => StorageService());
  getIt.registerLazySingleton<AuthenticationApiService>(
      () => AuthenticationApiService());
  getIt.registerLazySingleton<UserApiService>(() => UserApiService());
  getIt.registerLazySingleton<BookingService>(() => BookingService());
  getIt.registerLazySingleton<ServicesApiService>(() => ServicesApiService());
}
