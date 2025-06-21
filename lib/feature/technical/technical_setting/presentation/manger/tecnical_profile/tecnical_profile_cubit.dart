import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/technical/technical_setting/data/datasourse/tecnical_profile_data_sourse.dart';
import 'package:splash_app/feature/technical/technical_setting/data/repo_implamenation/tecnical_profile_repo_implemantion.dart';
import 'package:splash_app/feature/technical/technical_setting/domain/entity/profile_tecnical_entity.dart';
import 'package:splash_app/feature/technical/technical_setting/domain/repo/tecnical_profile_repo.dart';
import 'package:splash_app/feature/technical/technical_setting/domain/use_case/get_tecnical_profile_use_case.dart';
import 'package:splash_app/feature/technical/technical_setting/presentation/manger/tecnical_profile/tecnical_profile_state.dart';

class TecnicalProfileCubit extends Cubit<TecnicalProfileState> {
  TecnicalProfileCubit() : super(TecnicalProfileState());
// List<OrderEntity> _orders = [];
Future<ProfileTecnicalEntity> getTecicalProfile() async {
 TecnicalProfileRepo tecnicalProfileRepo = triggerRepoOrder(); //
  emit(IsLoadingTecnicalProfileState());

  dynamic response = await GetTecnicalProfileUseCase(tecnicalProfileRepo).execute();
  
  return response.fold(
    (errorModel) {
      emit(FaliureTecnicalProfileState(errorMessage: errorModel.errorMessage));
   throw Exception(errorModel.errorMessage);
     // return null; // Return an empty list to ensure a valid return type
    },
    (orderList) {
    
      emit(SuccessTecnicalProfileState(orderList, successMessage: 'Success'));
     // _orders = orderList;
      return orderList; // Return the fetched orders
    },
  );
}

//! this code for trigger repos and contract between layers
  TecnicalProfileRepo triggerRepoOrder() {
    ApiConsumer api = DioConsumer(dio: Dio());
  TecnicalProfileDataSourse tecnicalProfileDataSourse = TecnicalProfileDataSourse(api);

    TecnicalProfileRepo tecnicalProfileRepo =
        TecnicalProfileRepoImplemantion(baseTecnicalProfileRemoteDataSource: tecnicalProfileDataSourse);

    return tecnicalProfileRepo;
  }
}
