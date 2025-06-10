import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/functions/convert_string_numbers_to_one_intger_number.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/data/datasource/user_remote_data_source.dart';
import 'package:splash_app/feature/authentaction/data/repo_implimentation/user_repo_implementation.dart';
import 'package:splash_app/feature/authentaction/domain/repo/user_repo/user_repo.dart';
import 'package:splash_app/feature/authentaction/domain/usecases/confirm_email_usecase.dart';
import 'package:splash_app/feature/authentaction/domain/usecases/confirmation_code_usecase.dart';
import 'package:splash_app/feature/authentaction/domain/usecases/login_usecase.dart';
import 'package:splash_app/feature/authentaction/domain/usecases/reset_password_usecases.dart';
import 'package:splash_app/feature/authentaction/domain/usecases/signup_usecase.dart';
import 'package:splash_app/feature/authentaction/domain/usecases/verfiy_code_usecase.dart';
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
  TextEditingController otpFrogetPassword1 = TextEditingController();
  TextEditingController otpFrogetPassword2 = TextEditingController();
  TextEditingController otpFrogetPassword3 = TextEditingController();
  TextEditingController otpFrogetPassword4 = TextEditingController();
  TextEditingController otpSignUp1 = TextEditingController();
  TextEditingController otpSignUp2 = TextEditingController();
  TextEditingController otpSignUp3 = TextEditingController();
  TextEditingController otpSignUp4 = TextEditingController();
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
      emit(SuccessUserState(StringsManager.verifyYourAcount));
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
    int restCode = 1111;
    if (verifcationCodeKey.currentState!.validate()) {
      restCode = convertStringNumbersToOneIntNumber(
        n1: otpFrogetPassword1.text,
        n2: otpFrogetPassword2.text,
        n3: otpFrogetPassword3.text,
        n4: otpFrogetPassword4.text,
      );
    }
    final String password = CacheHelper().getData(key: ApiKey.password);

    UserRepo repo = triggerRepo();
    emit(IsLoadingUserState());
    dynamic response = await VerfiyCodeUsecase(repo).excute(
        email: email!,
        resetCode: convertStringNumbersToOneIntNumber(
          n1: otpFrogetPassword1.text,
          n2: otpFrogetPassword2.text,
          n3: otpFrogetPassword3.text,
          n4: otpFrogetPassword4.text,
        ));
    response.fold(
        (errorModel) =>
            emit(FaliureUserState(errorMessage: errorModel.errorMessage)),
        (responseModel) async {
      await ResetPasswordUsecases(repo: repo)
          .excute(newPassword: password, email: email);

      return emit(SuccessUserState(responseModel.masseage));
    });
  }
  void confirmEmail() async {
    String? email = CacheHelper().getDataString(key: ApiKey.email);
    CacheHelper()
        .saveData(key: ApiKey.confimationCode, value: ApiKey.confimationCode);

    // int confirmactionCode = convertStringNumbersToOneIntNumber(
    //   n1: otpSignUp1.text,
    //   n2: otpSignUp2.text,
    //   n3: otpSignUp3.text,
    //   n4: otpSignUp4.text,
    //  );
    UserRepo repo = triggerRepo();
    emit(IsLoadingUserState());
    dynamic response = await ConfirmEmailUsecase(repo).excute(
        email: email!,
        confirmationCode: convertStringNumbersToOneIntNumber(
          n1: otpSignUp1.text,
          n2: otpSignUp2.text,
          n3: otpSignUp3.text,
          n4: otpSignUp4.text,
        ));
    response.fold(
        (errorModel) =>
            emit(FaliureUserState(errorMessage: errorModel.errorMessage)),
        (responseModel) {
      return emit(SuccessUserState(responseModel.masseage));
    });
  }

  void frogetPasswordByEmail() async {
    emit(IsLoadingUserState());
    UserRepo repo = triggerRepo();
    CacheHelper().saveData(key: ApiKey.email, value: forgetPasswrdEmail.text);
    CacheHelper()
        .saveData(key: ApiKey.password, value: forgetPasswrdNewPassword.text);

    dynamic response = await ConfirmationCodeUsecase(repo).excute(
      email: forgetPasswrdEmail.text,
    );
    response.fold(
        (errorModel) =>
            emit(FaliureUserState(errorMessage: errorModel.errorMessage)),
        (responseModel) {
      return emit(SuccessUserState(StringsManager.verifyYourAcount));
    });
  }

  void resetPassword() async {
    emit(IsLoadingUserState());
    UserRepo repo = triggerRepo();
    CacheHelper().saveData(key: ApiKey.email, value: forgetPasswrdEmail.text);

    dynamic response = await ResetPasswordUsecases(repo: repo).excute(
      email: forgetPasswrdEmail.text,
      newPassword: forgetPasswrdNewPassword.text,
    );
    response.fold(
        (errorModel) =>
            emit(FaliureUserState(errorMessage: errorModel.errorMessage)),
        (responseModel) {
      CacheHelper().saveData(key: ApiKey.email, value: forgetPasswrdEmail.text);
      return emit(SuccessUserState(StringsManager.verifyYourAcount));
    });
  }

//
}

//! this code for trigger repos and contract between layers
UserRepo triggerRepo() {
  ApiConsumer api = DioConsumer(dio: Dio());
  BaseUserRemoteDataSource remoteDataSource = UserRemoteDataSource(api);
  UserRepo repo =
      UserRepoImplementation(baseUserRemoteDataSource: remoteDataSource);
  return repo;
}
