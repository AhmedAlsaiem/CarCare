import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/technical/technical_setting/data/datasourse/update_profile_date_sourse.dart';
import 'package:splash_app/technical/technical_setting/data/moedel/update_profile_model.dart';
import 'package:splash_app/technical/technical_setting/domain/entity/update_profile_entity.dart';
import 'package:splash_app/technical/technical_setting/domain/repo/update_profile_repo.dart';

class UpdateProfileRepoImplamentation extends UpdateProfileRepo {
  BaseUpdateProfileRemoteDataSource baseUpdateProfileRemoteDataSource;
  UpdateProfileRepoImplamentation({required this.baseUpdateProfileRemoteDataSource});

  @override
  Future<Either<ErrorModel, UpdateProfileEntity>> updateProfile({
    required String name,
    required String email,  
    required String phoneNumber,
    required String id
  }) async {

    try{

       UpdateProfileModel updateProfileModel =
          await baseUpdateProfileRemoteDataSource.updateProfile(
            name: name,
            email: email,
            phoneNumber: phoneNumber,
            id: id  
          );
      return right(updateProfileModel);

    }on ServerException catch(e){
        return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }
   
  }


}
