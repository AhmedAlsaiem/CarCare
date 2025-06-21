import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/technical/technical_home/domain/entity/location_entity.dart';

abstract class LocationRepo {
  Future<Either<ErrorModel,LocationEntity >> setLocation({required String id , required double latitude , required double longitude}) ;

}