import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/functions/convert_string_numbers_to_one_intger_number.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/data/datasource/user_remote_data_source.dart';
import 'package:splash_app/feature/authentaction/data/repo_implimentation/user_repo_implementation.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';
import 'package:splash_app/feature/authentaction/domain/usecases/login_usecase.dart';
import 'package:splash_app/feature/authentaction/domain/usecases/signup_usecase.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/user_cubit/user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState());
  // Keys
      GlobalKey<FormState> verifcationCodeKey = GlobalKey();

//? controllers
  TextEditingController forgetPasswrdEmail = TextEditingController();
  TextEditingController forgetPasswrdNewPassword = TextEditingController();
  TextEditingController loginPhoneNumber = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpUserName = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController otp1 = TextEditingController();
  TextEditingController otp2 = TextEditingController();
  TextEditingController otp3 = TextEditingController();
  TextEditingController otp4 = TextEditingController();
  //!
  void userSignUp() async {
    emit(IsLoadingUserState());
    UserRepo repo = triggerRepo();
    dynamic respone = await SignupUsecase(repo).excute(
        email: signUpEmail.text,
        password: signUpPassword.text,
        userName: signUpUserName.text,
        type: 1,
        phoneNumber: signUpPhoneNumber.text);
    respone.fold(
        (errorModel) =>
            emit(FaliureUserState(errorMessage: errorModel.errorMessage)),
        (userModel) {
      return emit(SuccessUserState(StringsManager.verifyYourAcount));
    });
  }

  void login() async {
    UserRepo repo = triggerRepo();
    emit(IsLoadingUserState());
    dynamic respone = await LoginUsecase(repo).excute(
        password: loginPassword.text, phoneNumber: loginPhoneNumber.text);
    respone.fold(
        (errorModel) =>
            emit(FaliureUserState(errorMessage: errorModel.errorMessage)),
        (userModel) {
      return emit(SuccessUserState(userModel.type));
    });
  }

  void verfiyEmail() async {
    String? email = CacheHelper().getDataString(key: ApiKey.email);
    int restCode = convertStringNumbersToOneIntNumber(
      n1: otp1.text,
      n2: otp2.text,
      n3: otp3.text,
      n4: otp4.text,
    );
    UserRepo repo = triggerRepo();
    emit(IsLoadingUserState());
    dynamic response =
        await repo.verifyCode(email: email!, resetcode: restCode);
    response.fold(
        (errorModel) =>
            emit(FaliureUserState(errorMessage: errorModel.errorMessage)),
        (responseModel) {
      return emit(SuccessUserState(responseModel.message));
    });
  }
}
//! this code for trigger repos and contract between layers
UserRepo triggerRepo() {
  ApiConsumer api = DioConsumer(dio: Dio());
  BaseUserRemoteDataSource remoteDataSource = UserRemoteDataSource(api);
  UserRepo repo =
      UserRepoImplementation(baseUserRemoteDataSource: remoteDataSource);
  return repo;
}
