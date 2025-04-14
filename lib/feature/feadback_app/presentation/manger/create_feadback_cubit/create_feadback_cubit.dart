import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/feadback_app/data/datasourse/feadback_remote_data_sourse.dart';
import 'package:splash_app/feature/feadback_app/data/repo_implimentation/feadback_repo_implemntation.dart';
import 'package:splash_app/feature/feadback_app/domain/entity/feadback_entities.dart';
import 'package:splash_app/feature/feadback_app/domain/repo/feadback_repo.dart';
import 'package:splash_app/feature/feadback_app/domain/usecase/create_feadback.dart';
import 'package:splash_app/feature/feadback_app/domain/usecase/get_feadback.dart';
import 'package:splash_app/feature/feadback_app/domain/usecase/update_feadback.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/create_feadback_cubit/create_feadback_state.dart';

class FeadbackCubit extends Cubit<FeadbackState> {
  FeadbackCubit() : super(FeadbackState());


  TextEditingController commentFeadback = TextEditingController();
  double rating = 0;
  TextEditingController updateFeadback = TextEditingController();
  double updaterating = 0;
   FeadbackEntities? feadback;



  void createFeadback() async {
    FeadbackRepo feadbackRepo = triggerRepoFeadback(); //
    emit(IsLoadingFeadbackState());
    dynamic respone = await CreateFeadbackUsecase(feadbackRepo)
        .excute(rating: rating, comment: commentFeadback.text);
    respone.fold(
        (errorModel) =>
            emit(FaliureFeadbackState(errorMessage: errorModel.errorMessage)),
        (feadbackModel) {
    
      return emit(SuccessFeadbackState(feadbackModel, 'faedback success'));
    });
  }

  Future<FeadbackEntities> getFeadback() async {
  
    FeadbackRepo feadbackRepo = triggerRepoFeadback(); //
    emit(IsLoadingFeadbackState());
    dynamic respone = await GetFeadbackUsecase(feadbackRepo).excute();
    
    respone.fold(
        (errorModel) =>
            emit(FaliureFeadbackState(errorMessage: errorModel.errorMessage)),
        (userModel) {
      feadback = userModel;
     return  emit(SuccessGetFeadbackState(userModel, ''));
    });
    return feadback!;
  }




  

  void updateFeadBack({required int id}) async {

    FeadbackRepo feadbackRepo = triggerRepoFeadback(); //
    emit(IsLoadingFeadbackState());
    dynamic respone = await UpdateFeadbackUsecase(feadbackRepo)
        .excute(id: id, rating: updaterating, comment: updateFeadback.text);
    respone.fold(
        (errorModel) =>
            emit(FaliureFeadbackState(errorMessage: errorModel.errorMessage)),
        (userModel) {
    //  feadback = userModel;
      return emit(SuccessFeadbackState(userModel, 'update success'));
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
