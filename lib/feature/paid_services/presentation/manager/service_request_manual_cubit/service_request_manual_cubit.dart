import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/paid_services/data/datasource/service_request_manual_remote_data_source.dart';
import 'package:splash_app/feature/paid_services/data/repo_implimentation/service_request_manual_repo_implamentation.dart';
import 'package:splash_app/feature/paid_services/domain/repo/service_request_manual_repo.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_state.dart';

class ServiceRequestManualCubit extends Cubit<ServiceRequestManualState> {
  ServiceRequestManualRepo repo = makecontractbetweenaracticatureLayers();
  ServiceRequestManualCubit() : super(ServiceRequestManualInatialState());
  void createRequestForWinch({
    required int serviceTypeId,
    required String techId,
    required String typeOfWinch,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  }) {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = repo.createRequestForWinch(
        serviceTypeId: serviceTypeId,
        techId: techId,
        typeOfWinch: typeOfWinch,
        userLatitude: userLatitude,
        userLongitude: userLongitude,
        servicePrice: servicePrice);
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      emit(
        ServiceRequestManualSucessState(serviceRequestModel: requestModel),
      );
    });
  }

  void createRequestForOil({
    required int serviceTypeId,
    required String techId,
    required String typeOfOil,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
  }) async {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = await repo.createRequestForOil(
        serviceTypeId: serviceTypeId,
        techId: techId,
        typeOfOil: typeOfOil,
        userLatitude: userLatitude,
        userLongitude: userLongitude,
        servicePrice: servicePrice);
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      emit(
        ServiceRequestManualSucessState(serviceRequestModel: requestModel),
      );
    });
  }

  void createRequestForTire({
    required int serviceTypeId,
    required String techId,
    required String tireSize,
    required double userLatitude,
    required int serviceQuantity,
    required double userLongitude,
    required double servicePrice,
  }) {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = repo.createRequestForTire(
        serviceTypeId: serviceTypeId,
        techId: techId,
        tireSize: tireSize,
        userLatitude: userLatitude,
        serviceQuantity: serviceQuantity,
        userLongitude: userLongitude,
        servicePrice: servicePrice);
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      emit(
        ServiceRequestManualSucessState(serviceRequestModel: requestModel),
      );
    });
  }

  void createRequestForBatteries({
    required int serviceTypeId,
    required String techId,
    required String typeOfBattery,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  }) {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = repo.createRequestForBatteries(
      serviceTypeId: serviceTypeId,
      techId: techId,
      typeOfBattery: typeOfBattery,
      userLatitude: userLatitude,
      userLongitude: userLongitude,
      servicePrice: servicePrice,
      serviceQuantity: serviceQuantity,
    );
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      emit(
        ServiceRequestManualSucessState(serviceRequestModel: requestModel),
      );
    });
  }

  void createRequestForFuel({
    required int serviceTypeId,
    required String techId,
    required String typeOfFuel,
    required double userLatitude,
    required double userLongitude,
    required double servicePrice,
    required int serviceQuantity,
  }) {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = repo.createRequestForFuel(
      serviceTypeId: serviceTypeId,
      techId: techId,
      typeOfFuel: typeOfFuel,
      userLatitude: userLatitude,
      userLongitude: userLongitude,
      servicePrice: servicePrice,
      serviceQuantity: serviceQuantity,
    );
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      emit(
        ServiceRequestManualSucessState(serviceRequestModel: requestModel),
      );
    });
  }

  void updateTechincal({
    required int serviceTypeId,
    required String techId,
    required String orderId,
  }) {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = repo.updateTechincal(
      serviceTypeId: serviceTypeId,
      techId: techId,
      orderId: orderId,
    );
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      emit(
        ServiceRequestManualSucessState(serviceRequestModel: requestModel),
      );
    });
  }
}

ServiceRequestManualRepo makecontractbetweenaracticatureLayers() {
  ApiConsumer api = DioConsumer(dio: Dio());
  BaseServiceRequestManuallyRemoteDataSource dataSource =
      ServiceRequestManualRemoteDataSource(api: api);
  ServiceRequestManualRepo repo =
      ServiceRequestManualRepoImplamentation(dataSource: dataSource);
  return repo;
}
