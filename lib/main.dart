import 'package:anywash/core/services/storage-service.dart';
import 'package:anywash/locator.dart';
import 'package:anywash/routes/routes.dart';
import 'package:anywash/spleshscreen.dart';
import 'package:anywash/utils/colornotifire.dart';
import 'package:anywash/utils/initializer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'core/services/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//load file with keys
  await dotenv.load(fileName: ".env");

  //setup dependency injector
  dependenciesInjectorSetup();

  // check if user is logged in or not
  bool isLoggedIn = false;
  StorageService storageService = getIt<StorageService>();
  String _token = await storageService.readItem(key: "token") ?? '';
  isLoggedIn = _token.isNotEmpty;

  //initial api calls to be made to get data from API
  await getIt<Initializer>().initialCalls();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ColorNotifire()),
      ],
      child: OKToast(
          child: ScreenUtilInit(
              designSize: const Size(390, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (
                child,
                _,
              ) {
                return GetMaterialApp(
                  navigatorKey: getIt<NavigationService>().navigatorKey,
                  onGenerateRoute: Routers.generateRoute,
                  // initialRoute: getIt<UserService>().hasToken
                  //     ? PageRoutes.homeOrderAccountPage
                  //     : PageRoutes.loginNavigator,
                  home: const SplashScreen(),
                  debugShowCheckedModeBanner: false,
                );
              })),
    ),
  );
}
