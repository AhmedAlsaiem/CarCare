import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/user_profile/data/remote_datasource/user_profile_remote_datasouce.dart';
import 'package:splash_app/feature/user_profile/data/repo_implimentation/user_profile_repo_implamentation.dart';
import 'package:splash_app/feature/user_profile/domain/entities/user_profile_entity.dart';
import 'package:splash_app/feature/user_profile/domain/repo/user_profile_repo.dart';
import 'package:splash_app/feature/user_profile/domain/usecases/get_current_user_usecase.dart';
import 'package:splash_app/feature/user_profile/domain/usecases/update_current_user_usecase.dart';
import 'package:splash_app/feature/user_profile/presentation/manager/cubit/user_Profile_cubit/user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  TextEditingController editEmailController = TextEditingController();
  TextEditingController editUserNameController = TextEditingController();
  TextEditingController editPhoneNumberController = TextEditingController();
  UserProfileEntity? user;
  UserProfileCubit() : super(UserProfileInatialState());

  Future<void> getCurrentUser() async {
    emit(UserProfileIsLoadingState());
    ApiConsumer api = DioConsumer(dio: Dio());
    BaseUserProfileRemoteDatasouce baseUserProfileRemoteDatasouce =
        UserProfileRemoteDatasouce(api: api);
    UserProfileRepo repo = UserProfileRepoImplamentation(
        baseUserProfileRemoteDatasouce: baseUserProfileRemoteDatasouce);

    dynamic response =
        await GetCurrentUserUsecaseUserProfile(userProfileRepo: repo).excute();

    response.fold(
        (errorModel) =>
            emit(UserProfileFailedState(errorMassage: errorModel.errorMessage)),
        (userModel) {
      user = userModel;
      return emit(UserProfileSucessState(user: userModel));
    });
  }

  Future<void> updateCurrentUser() async {
    emit(UserProfileIsLoadingState());
    ApiConsumer api = DioConsumer(dio: Dio());
    BaseUserProfileRemoteDatasouce baseUserProfileRemoteDatasouce =
        UserProfileRemoteDatasouce(api: api);
    UserProfileRepo repo = UserProfileRepoImplamentation(
        baseUserProfileRemoteDatasouce: baseUserProfileRemoteDatasouce);

    dynamic response =
        await UpdateCurrentUserProfileUseCase(userProfileRepo: repo).excute(
      email: getCurrentText(editEmailController, user!.email),
      userName: getCurrentText(editUserNameController, user!.userName),
      phoneNumber: user!.phoneNumber,
    );

    response.fold(
        (errorModel) =>
            emit(UserProfileFailedState(errorMassage: errorModel.errorMessage)),
        (userModel) {
      return emit(UserProfileSucessState(user: userModel));
    });
  }
}

String getCurrentText(TextEditingController controller, String defultData) {
  return controller.text.isEmpty ? defultData : controller.text;
}
