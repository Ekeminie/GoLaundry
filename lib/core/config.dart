import 'enum/flavors.dart';
import 'services/web-services/nertwork_config.dart';

class Config {
  static Flavor? appFlavor;
  static String get BASEURL {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return NetworkConfig.BASE_URL;
      case Flavor.DEVELOPMENT:
      default:
        return '';
    }
  }
}
