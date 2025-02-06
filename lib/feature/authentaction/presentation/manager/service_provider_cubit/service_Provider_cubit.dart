import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/core/utils/string_manager.dart';
import 'package:splash_app/feature/authentaction/data/datasource/service_provider_remote_data_source.dart';
import 'package:splash_app/feature/authentaction/data/repo_implimentation/service_povider_repo_implemationtion.dart';
import 'package:splash_app/feature/authentaction/domain/repo/service_provider_repo/service_privider_repo.dart';
import 'package:splash_app/feature/authentaction/domain/usecases/service_Provider_signup_usecase.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/service_provider_cubit/service_provider_state.dart';

class ServiceProviderCubit extends Cubit<ServiceProviderState> {
  ServiceProviderCubit() : super(ServiceProviderState());
  

//? controllers
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpUserName = TextEditingController();
  TextEditingController nationalId = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();

  //!
  void serviceProviderSignUp() async {
    emit(IsLoadingServiceProviderState());
    ServiceProviderRepo repo = triggerRepo();
    dynamic respone = await ServiceProviderSignupUsecase(repo: repo).excute(
        email: signUpEmail.text,
        password: signUpPassword.text,
        userName: signUpUserName.text,
        nationalId: nationalId.text,
        phoneNumber: signUpPhoneNumber.text);
    respone.fold(
        (errorModel) => emit(
            FaliureServiceProviderState(errorMessage: errorModel.errorMessage)),
            
        (userModel) {
      return emit(SuccessServiceProviderState(StringsManager.verifyYourAcount));
    });
  }

//! this code for trigger repos and contract between layers
  ServiceProviderRepo triggerRepo() {
    ApiConsumer api = DioConsumer(dio: Dio());
    BaseServiceProviderRemoteDataSource remoteDataSource =
        ServiceProviderRemoteDataSource(api: api);
    ServiceProviderRepo repo = ServicePoviderRepoImplemationtion(
        baseServiceProviderRemoteDataSource: remoteDataSource);
    return repo;
  }
}
