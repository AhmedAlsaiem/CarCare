import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/feature/technical/technical_home/data/datasource/location_remote_data_source.dart';
import 'package:splash_app/feature/technical/technical_home/data/model/location_model.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/location_entity.dart';
import 'package:splash_app/feature/technical/technical_home/domain/repo/location_repo.dart';

class LocationRepoImplamentation implements LocationRepo {
  BaseLocationRemoteDataSource baseLocationRemoteDataSource;

  LocationRepoImplamentation({ required this.baseLocationRemoteDataSource});
  @override
  Future<Either<ErrorModel, LocationEntity>> setLocation({required String id, required double latitude, required double longitude}) async {
     try {
      LocationModel locationModel = await baseLocationRemoteDataSource.setLocation(id: id, latitude: latitude, longitude: longitude);
     
      return right(locationModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
  }
}