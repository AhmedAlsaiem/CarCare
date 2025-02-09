import 'package:splash_app/core/utils/string_manager.dart';

String secureEmail({required String email}) {
  String secureEmail = email.substring(0, 3);
  secureEmail += StringsManager.star;
  secureEmail += StringsManager.gmailcom;
  return secureEmail;
}
