import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/feature/authentaction/data/model/service_provider_model.dart';

import '../../feature/authentaction/data/model/user_model.dart';
import '../helper/cache_helper.dart';

void saveUserData({required UserModel acount}) {
  CacheHelper().saveData(key: ApiKey.token, value: acount.token);
  CacheHelper().saveData(key: ApiKey.refreshToken, value: acount.refreshToken);
  CacheHelper().saveData(key: ApiKey.email, value: acount.email);
  CacheHelper().saveData(key: ApiKey.type, value: acount.type);
  CacheHelper().saveData(key: ApiKey.phoneNumber, value: acount.phoneNumber);
  CacheHelper().saveData(key: ApiKey.fullName, value: acount.userName);
  CacheHelper().saveData(key: ApiKey.id, value: acount.id);
}

void saveServiceProviderData({required ServiceProviderModel acount}) {
  CacheHelper().saveData(key: ApiKey.token, value: acount.token);
  CacheHelper().saveData(key: ApiKey.email, value: acount.email);
  CacheHelper().saveData(key: ApiKey.type, value: acount.type);
  CacheHelper().saveData(key: ApiKey.phoneNumber, value: acount.phoneNumber);
  CacheHelper().saveData(key: ApiKey.fullName, value: acount.userName);
  CacheHelper().saveData(key: ApiKey.id, value: acount.id);
  CacheHelper().saveData(key: ApiKey.nationalId, value: acount.id);
}
