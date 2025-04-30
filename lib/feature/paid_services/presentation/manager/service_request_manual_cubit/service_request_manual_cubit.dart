import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/paid_services/data/datasource/service_request_manual_remote_data_source.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'package:splash_app/feature/paid_services/domain/repo/service_request_manual_repo.dart';

import '../../../data/repo_implimentation/service_request_manual_repo_implamentation.dart';
import 'service_request_manual_state.dart';

class ServiceRequestManualCubit extends Cubit<ServiceRequestManualState> {
  ServiceRequestManualRepo repo = makecontractbetweenaracticatureLayers();
  ServiceRequestManualCubit() : super(ServiceRequestManualInatialState());
  static ServiceRequestEntity? requestEntity;
  static int _serviceId = 0;
  set serviceId(int id) {
    _serviceId = id;
  }

  // ignore: unnecessary_getters_setters
  int get serviceId => _serviceId;

  static int _serviceQuantity = 1;
  set serviceQuantity(int serviceQuantity) {
    _serviceQuantity = serviceQuantity;
  }

  static String _techId = '';
  set techId(String techId) {
    _techId = techId;
  }

  static String _typeOfService = '';
  set typeOfService(String typeOfService) {
    _typeOfService = typeOfService;
  }

  static double _price = 0.0;
  set price(double price) {
    _price = price;
  }

  Future<void> createRequestForWinch() async {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = await repo.createRequestForWinch(
        serviceTypeId: _serviceId,
        techId: _techId,
        typeOfWinch: _typeOfService,
        userLatitude: 42.2,
        userLongitude: 323.2,
        servicePrice: _price);
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createRequestForOil() async {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = await repo.createRequestForOil(
        serviceTypeId: _serviceId,
        techId: _techId,
        typeOfOil: _typeOfService,
        userLatitude: 42.2,
        userLongitude: 323.2,
        servicePrice: _price);
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createRequestForTire() async {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = await repo.createRequestForTire(
        serviceTypeId: _serviceId,
        techId: _techId,
        tireSize: _typeOfService,
        userLatitude: 42.2,
        serviceQuantity: _serviceQuantity,
        userLongitude: 323.2,
        servicePrice: _price);
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createRequestForBatteries() async {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = await repo.createRequestForBatteries(
      serviceTypeId: _serviceId,
      techId: _techId,
      typeOfBattery: _typeOfService,
      userLatitude: 42.2,
      userLongitude: 323.2,
      servicePrice: _price,
      serviceQuantity: _serviceQuantity,
    );
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualUpdateSucessState(
          serviceRequestModel: requestModel));
    });
  }

  void createRequestForFuel() async {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = await repo.createRequestForFuel(
      serviceTypeId: _serviceId,
      techId: _techId,
      typeOfFuel: _typeOfService,
      userLatitude: 42.2,
      userLongitude: 323.2,
      servicePrice: _price,
      serviceQuantity: _serviceQuantity,
    );
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void updateTechincal({
    required String orderId,
  }) async {
    emit(ServiceRequestManualIsLoadinState());
    dynamic response = await repo.updateTechincal(
      serviceTypeId: _serviceId,
      techId: _techId,
      orderId: orderId,
    );
    response.fold(
        (errorModel) => emit(
              ServiceRequestManualFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void handleAllRequestManualFunctions() {
    switch (_serviceId) {
      case 1:
        createRequestForWinch();
        break;
      case 2:
        createRequestForTire();
        break;
      case 3:
        createRequestForFuel();
        break;
      case 4:
        createRequestForBatteries();
        break;
      case 5:
        createRequestForOil();
      case 6:
        break;
      default:
    }
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
