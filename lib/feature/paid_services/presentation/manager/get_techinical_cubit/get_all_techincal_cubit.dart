import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/paid_services/data/datasource/get_all_techinical_remote_data_source.dart';
import 'package:splash_app/feature/paid_services/data/repo_implimentation/get_all_technical_repo_implamentation.dart';
import 'package:splash_app/feature/paid_services/domain/repo/get_all_techinical_for_order_repo.dart';
import 'package:splash_app/feature/paid_services/domain/usecases/get_all_techinical_ordered_by_rate_and_distance_usecase.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/get_techinical_cubit/get_all_techincal_state.dart';

class GetAllTechincalCubit extends Cubit<GetAllTechincalState> {
  GetAllTechincalCubit() : super(GetAllTechinicalIntialState());
  void getAlltechinicalOrderedByDistanceAndRate(
      {required int serviceId}) async {
    GetAllTechinicalForOrderRepo repo = makecontractbetweenaracticatureLayers();
    emit(GetAllTechinicalIsLoadinState());
    dynamic response =
        await GetAllTechinicalOrderedByRateAndDistanceUsecase(repo: repo)
            .excute(userLatidude: 130, userLangtude: 130, serviceId: serviceId);
    response.fold(
        (errorModel) => emit(
              GetAllTechinicalFailedState(errorMessage: errorModel),
            ), (techincalList) {
      emit(
        GetAllTechinicalSucessState(techinicalList: techincalList),
      );
    });
  }

  void getAlltechinicalOrderedByDistance({required int serviceId}) async {
    GetAllTechinicalForOrderRepo repo = makecontractbetweenaracticatureLayers();
    emit(GetAllTechinicalIsLoadinState());
    dynamic response =
        await GetAllTechinicalOrderedByRateAndDistanceUsecase(repo: repo)
            .excute(userLatidude: 130, userLangtude: 130, serviceId: serviceId);
    response.fold(
        (errorModel) => emit(
              GetAllTechinicalFailedState(
                  errorMessage: errorModel.errorMessage),
            ), (techincalList) {
      emit(
        GetAllTechinicalSucessState(techinicalList: techincalList),
      );
    });
  }
}

GetAllTechinicalForOrderRepo makecontractbetweenaracticatureLayers() {
  ApiConsumer api = DioConsumer(dio: Dio());
  BaseGetAllTechinicalRemoteDataSource baseGetAllTechinicalRemoteDataSource =
      GetAllTechinicalRemoteDataSource(api: api);
  GetAllTechinicalForOrderRepo repo = GetAllTechnicalRepoImplamentation(
      baseGetAllTechinicalRemoteDataSource:
          baseGetAllTechinicalRemoteDataSource);
  return repo;
}
