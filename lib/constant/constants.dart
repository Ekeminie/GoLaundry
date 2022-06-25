import 'package:flutter_dotenv/flutter_dotenv.dart';

const String token = 'token';
const String currentUser = 'currentUser';
const String settings = 'settings';
const String imagePath = "assets/images/";
String publicKey = dotenv.env['PUBLIC_KEY']!;
String encryptionKey = dotenv.env['ENCRYPTION_KEY']!;

class Constants {
  static const String BASE_URL = "";
  static const String EMAIL = "support@londree.ng";
  static const String PHONE = "+234 901 106 7774";
}
