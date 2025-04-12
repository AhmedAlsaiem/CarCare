import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/core/api/end_point.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'package:splash_app/feature/feadback_app/data/datasourse/feadback_remote_data_sourse.dart';
import 'package:splash_app/feature/feadback_app/data/repo_implimentation/feadback_repo_implemntation.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';
import 'package:splash_app/feature/feadback_app/domain/repo/feadback_repo.dart';
import 'package:splash_app/feature/feadback_app/domain/usecase/create_feadback.dart';
import 'package:splash_app/feature/feadback_app/domain/usecase/get_app_feadback.dart';
import 'package:splash_app/feature/feadback_app/domain/usecase/get_feadback.dart';
import 'package:splash_app/feature/feadback_app/domain/usecase/update_feadback.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_state.dart';

class FeadbackCubit extends Cubit<FeadbackState> {
  FeadbackCubit() : super(FeadbackState());
  // Keys
  //GlobalKey<FormState> verifcationCodeKey = GlobalKey();

  TextEditingController commentFeadback = TextEditingController();
  double rating = 0;
  TextEditingController updateFeadback = TextEditingController();
  double updaterating = 0;
  FeadbackEntities? feadback;
  GetappFeadBackEntities? getappFeadBackEntities;
  //!

  void createFeadback() async {
    FeadbackRepo feadbackRepo = triggerRepoFeadback(); //
    emit(IsLoadingFeadbackState());
    dynamic respone = await CreateFeadbackUsecase(feadbackRepo)
        .excute(rating: rating, comment: commentFeadback.text);
    respone.fold(
        (errorModel) =>
            emit(FaliureFeadbackState(errorMessage: errorModel.errorMessage)),
        (feadbackModel) {
             // saveIdFeaddback(feadback: userModel);
             CacheHelper().saveData(key: ApiKey.feadbackid, value: feadbackModel.id.toString());
      return emit(SuccessFeadbackState('faedback success'));
    });
  }


  void getFeadback() async {
    //String? id =  CacheHelper().getDataString(key: ApiKey.feadbackid);
   // int id = int.parse(CacheHelper().getData(key: ApiKey.id));
int id =int.parse( CacheHelper().getDataString(key: ApiKey.feadbackid)!) ;
   // print("**********${id}****");
    FeadbackRepo feadbackRepo = triggerRepoFeadback(); //
    emit(IsLoadingFeadbackState());
    dynamic respone = await GetFeadbackUsecase(feadbackRepo).excute(id: id);
    respone.fold(
        (errorModel) =>
            emit(FaliureFeadbackState(errorMessage: errorModel.errorMessage)),
        (userModel) {
      feadback = userModel;
      return emit(SuccessFeadbackState('faedback success'));
    });
  }

  void getappFeadback() async {
    // int id = int.parse(CacheHelper().getData(key: ApiKey.id));
    FeadbackRepo feadbackRepo = triggerRepoFeadback(); //
    emit(IsLoadingFeadbackState());
    dynamic respone = await GetappFeadbackUsecase(feadbackRepo).excute();
    respone.fold(
        (errorModel) =>
            emit(FaliureFeadbackState(errorMessage: errorModel.errorMessage)),
        (userModel) {
      getappFeadBackEntities = userModel;
      return emit(SuccessFeadbackState('faedback success'));
    });
  }

  void updateFeadBack() async {
  // int id =int.parse(CacheId().getDataString(key: ApiKey.feadbackid)!) ;
  //  int? id =  CacheHelper().getDataint(key: ApiKey.feadbackid);
int id =int.parse( CacheHelper().getDataString(key: ApiKey.feadbackid)!) ;

  //int? id = CacheHelper().getDataint(key: ApiKey.id);
    // int id = int.parse(CacheHelper().getData(key: ApiKey.id));
    FeadbackRepo feadbackRepo = triggerRepoFeadback(); //
    emit(IsLoadingFeadbackState());
    dynamic respone = await UpdateFeadbackUsecase(feadbackRepo)
        .excute(id: id, rating: updaterating, comment: updateFeadback.text);
    respone.fold(
        (errorModel) =>
            emit(FaliureFeadbackState(errorMessage: errorModel.errorMessage)),
        (userModel) {
      feadback = userModel;
      return emit(SuccessFeadbackState('update success'));
    });
  }

//! this code for trigger repos and contract between layers
  FeadbackRepo triggerRepoFeadback() {
    ApiConsumer api = DioConsumer(dio: Dio());
    FeadbackRemoteDataSourse feadbackRemoteDataSourse =
        FeadbackRemoteDataSourse(api);

    FeadbackRepo feadbackRepo = FeadbackRepoImplemntation(
        baseFaedbackRemoteDataSource: feadbackRemoteDataSourse);

    return feadbackRepo;
  }
}
