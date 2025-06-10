import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/feadback_app/data/datasourse/feadback_remote_data_sourse.dart';
import 'package:splash_app/feature/feadback_app/data/repo_implimentation/feadback_repo_implemntation.dart';
import 'package:splash_app/feature/feadback_app/domain/repo/feadback_repo.dart';
import 'package:splash_app/feature/feadback_app/domain/usecase/get_app_feadback.dart';
import 'package:splash_app/feature/feadback_app/presentation/manger/get_app_feadback/get_app_feadback_state.dart';

 class GetAppFeadbackCubit extends Cubit<GetAppFeadbackState> {
  GetAppFeadbackCubit() : super(GetAppFeadbackState());

  void getappFeadback() async {
   
    FeadbackRepo feadbackRepo = triggerRepoFeadback(); //
    emit(IsLoadingGetAppFeadbackState());
    dynamic respone = await GetappFeadbackUsecase(feadbackRepo).excute();
    respone.fold(
        (errorModel) =>
            emit(FaliureGetAppFeadbackState(errorMessage: errorModel.errorMessage)),
        (userModel) {
     
      return emit(SuccessGetAppFeadbackState(userModel,'faedback success'));
    });
  }

  FeadbackRepo triggerRepoFeadback() {
    ApiConsumer api = DioConsumer(dio: Dio());
    FeadbackRemoteDataSourse feadbackRemoteDataSourse =
        FeadbackRemoteDataSourse(api);

    FeadbackRepo feadbackRepo = FeadbackRepoImplemntation(
        baseFaedbackRemoteDataSource: feadbackRemoteDataSourse);

    return feadbackRepo;
  }

}