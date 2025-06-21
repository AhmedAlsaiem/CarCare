import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/technical/technical_home/data/datasource/location_remote_data_source.dart';
import 'package:splash_app/feature/technical/technical_home/data/repo_implamentation/location_repo_implamentation.dart';
import 'package:splash_app/feature/technical/technical_home/domain/repo/location_repo.dart';
import 'package:splash_app/feature/technical/technical_home/domain/use_case/set_location_use_case.dart';

import 'package:splash_app/feature/technical/technical_home/presentation/manger/location_cubit/location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationState());
  void setLocation(
      {required String id,
      required double latitude,
      required double longitude}) async {
    LocationRepo locationRepo = trigerLocation(); //
    emit(IsLoadingLocationState());
    dynamic respone = await SetLocationUseCase(locationRepo)
        .excute(id: id, latitude: latitude, longitude: longitude);
  
    respone.fold(
        (errorModel) =>
            emit(FaliureLocationState(errorMessage: errorModel.errorMessage)),
        (userModel) {
      //  feadback = userModel;
      return emit(SuccessLocationState(userModel));
    });
  }

  LocationRepo trigerLocation() {
    ApiConsumer api = DioConsumer(dio: Dio());
    LocationRemoteDataSource locationRemoteDataSource =
        LocationRemoteDataSource(api: api);

    LocationRepo locationRepo = LocationRepoImplamentation(
        baseLocationRemoteDataSource: locationRemoteDataSource);

    return locationRepo;
  }
}
