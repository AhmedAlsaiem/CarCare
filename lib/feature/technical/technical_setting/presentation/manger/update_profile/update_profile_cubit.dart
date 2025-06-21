import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/technical/technical_setting/data/datasourse/update_profile_date_sourse.dart';
import 'package:splash_app/feature/technical/technical_setting/data/repo_implamenation/update_profile_repo_implamentation.dart';
import 'package:splash_app/feature/technical/technical_setting/domain/entity/update_profile_entity.dart';
import 'package:splash_app/feature/technical/technical_setting/domain/repo/update_profile_repo.dart';
import 'package:splash_app/feature/technical/technical_setting/domain/use_case/update_profile_use_case.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/manger/update_profile/update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileState());
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nationalId = TextEditingController();

  Future<UpdateProfileEntity?> updateProfile() async {
    UpdateProfileRepo updateProfileRepo = triggerRepoUpdateProfile(); //
    emit(IsLoadingUpdateProfileState());

    dynamic response =
        await UpdateProfileUseCase(updateProfileRepo: updateProfileRepo).excute(
      email: email.text,
      userName: name.text,
      phoneNumber: phoneNumber.text,
     nationalId: nationalId.text,
    );

    return response.fold(
      (errorModel) {
        emit(FaliureUpdateProfileState(errorMessage: errorModel.errorMessage));
        return null;
        // return []; // Return an empty list to ensure a valid return type
      },
      (orderList) {
        emit(SuccessUpdateProfileState(orderList,
            successMessage: 'update successfully'));
        // _orders = orderList;
        return orderList; // Return the fetched orders
      },
    );
  }

//! this code for trigger repos and contract between layers
  UpdateProfileRepo triggerRepoUpdateProfile() {
    ApiConsumer api = DioConsumer(dio: Dio());
    UpdateProfileDateSourse updateProfileDateSourse =
        UpdateProfileDateSourse(api);

    UpdateProfileRepo updateProfileRepo = UpdateProfileRepoImplamentation(
        baseUpdateProfileRemoteDataSource: updateProfileDateSourse);
    return updateProfileRepo;
  }
}
