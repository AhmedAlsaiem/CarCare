import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/authentaction/data/datasource/get_all_services._datasource.dart';
import 'package:splash_app/feature/authentaction/data/repo_implimentation/get_all_services_repo_implementation.dart';
import 'package:splash_app/feature/authentaction/domain/repo/get_all_services_repo/get_all_services_repo.dart';
import 'package:splash_app/feature/authentaction/presentation/manager/get_all_services_cubit/get_all_services_state.dart';

class GetAllServicesCubit extends Cubit<GetAllServicesState> {
  GetAllServicesCubit() : super(GetAllServicesState());
  Future<void> getAllServices() async {
    emit(GetAllServicesIsLoadingState());
    ApiConsumer api = DioConsumer(dio: Dio());
    BaseGetAllSErvicesRemoteDataSource remoteDataSource =
        GetAllServicesRemoteDataSource(api: api);
    GetAllServicesRepo repo = GetAllServicesRepoImplementation(
        baseGetAllSErvicesRemoteDataSource: remoteDataSource);
    dynamic response = await repo.getAllSErvices();
    response.fold(
        (errorModel) => emit(
              GetAllServicesFaildState(erorrMessage: errorModel.errorMessage),
            ), (serviceList) {
      return emit(
        GetAllServicesSuccessState(servicesList: serviceList),
      );
    });
  }
}
