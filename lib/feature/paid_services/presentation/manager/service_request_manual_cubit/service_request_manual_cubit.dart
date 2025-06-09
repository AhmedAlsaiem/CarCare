import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/paid_services/data/datasource/service_request_automatic_remote_data_source.dart';
import 'package:splash_app/feature/paid_services/data/datasource/service_request_manual_remote_data_source.dart';
import 'package:splash_app/feature/paid_services/data/repo_implimentation/service_request_automatic_repo_implamentation.dart';
import 'package:splash_app/feature/paid_services/domain/enties/service_request_entity.dart';
import 'package:splash_app/feature/paid_services/domain/repo/service_request_automatic_repo.dart';
import 'package:splash_app/feature/paid_services/domain/repo/service_request_manual_repo.dart';

import '../../../data/repo_implimentation/service_request_manual_repo_implamentation.dart';
import 'service_request_manual_state.dart';

class ServiceRequestCubit extends Cubit<ServiceRequestState> {
  ServiceRequestManualRepo repo = makecontractbetweenaracticatureLayers();
  ServiceRequestAutomaticRepo repoAutomatic =
      makecontractbetweenaracticatureLayersAutomatic();
  ServiceRequestCubit() : super(ServiceRequestInatialState());

  static ServiceRequestEntity? requestEntity;
  static int _serviceId = 0;
  set serviceId(int id) {
    _serviceId = id;
  }

  static int _orderType = 1;
  set orderType(int id) {
    _orderType = id;
  }

  // ignore: unnecessary_getters_setters
  int get serviceId => _serviceId;

  // ignore: unnecessary_getters_setters
  int get orderType => _orderType;

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
 //Position location=await getCurrentMobileLocations();

   TextEditingController controller=TextEditingController();
  Future<void> createRequestForWinch() async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repo.createRequestForWinch(
        serviceTypeId: _serviceId,
        techId: _techId,
        typeOfWinch: _typeOfService,
        userLatitude: 42.2,
        userLongitude: 323.2,
        servicePrice: _price);
    response.fold(
        (errorModel) => emit(
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createRequestForOil() async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repo.createRequestForOil(
        serviceTypeId: _serviceId,
        techId: _techId,
        typeOfOil: _typeOfService,
        userLatitude: 42.2,
        userLongitude: 323.2,
        servicePrice: _price);
    response.fold(
        (errorModel) => emit(
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createRequestForTire() async {
    emit(ServiceRequestIsLoadinState());
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
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createRequestForBatteries() async {
    emit(ServiceRequestIsLoadinState());
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
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestUpdateSucessState(serviceRequestModel: requestModel));
    });
  }

  void createRequestForFuel() async {
    emit(ServiceRequestIsLoadinState());
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
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void updateTechincal({
    required String orderId,
  }) async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repo.updateTechincal(
      serviceTypeId: _serviceId,
      techId: _techId,
      orderId: orderId,
    );
    response.fold(
        (errorModel) => emit(
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }
// automatic order requests in mobile application

  Future<void> createAutomaticRequestForWinch() async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repoAutomatic.createRequestAutoMaticForWinch(
        serviceTypeId: _serviceId,
        typeOfWinch: _typeOfService,
        userLatitude: 42.2,
        userLongitude: 323.2,
        servicePrice: _price);
    response.fold(
        (errorModel) => emit(
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createAutomaticRequestForOil() async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repoAutomatic.createRequestAutomaticForOil(
        serviceTypeId: _serviceId,
        typeOfOil: _typeOfService,
        userLatitude: 42.2,
        userLongitude: 323.2,
        servicePrice: _price);
    response.fold(
        (errorModel) => emit(
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createAutomaticRequestForTire() async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repoAutomatic.createRequestAutomaticForTire(
        serviceTypeId: _serviceId,
        tireSize: _typeOfService,
        userLatitude: 42.2,
        serviceQuantity: _serviceQuantity,
        userLongitude: 323.2,
        servicePrice: _price);
    response.fold(
        (errorModel) => emit(
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createAutomaticRequestForBatteries() async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repoAutomatic.createRequestAutomaticForBatteries(
      serviceTypeId: _serviceId,
      typeOfBattery: _typeOfService,
      userLatitude: 42.2,
      userLongitude: 323.2,
      servicePrice: _price,
      serviceQuantity: _serviceQuantity,
    );
    response.fold(
        (errorModel) => emit(
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void createAutomaticRequestForFuel() async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repoAutomatic.createRequestAutomaticForFuel(
      serviceTypeId: _serviceId,
      typeOfFuel: _typeOfService,
      userLatitude: 42.2,
      userLongitude: 323.2,
      servicePrice: _price,
      serviceQuantity: _serviceQuantity,
    );
    response.fold(
        (errorModel) => emit(
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  void getOrderDetails({required int id}) async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repoAutomatic.getOrderDetails(id: id);
    response.fold(
        (errorModel) => emit(
              ServiceRequestFailedState(error: errorModel),
            ), (requestModel) {
      requestEntity = requestModel;

      emit(ServiceRequestManualSucessState(serviceRequestModel: requestModel));
    });
  }

  List<ServiceRequestEntity> orderList = [];

  int index = 1;
  Future<List<ServiceRequestEntity>> getAllOrdersForSepcificUser() async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repoAutomatic.getAllOrderDetailsForSpecificUser(
        index: index.toString());
    response.fold((errorModel) {
      emit(ServiceRequestFailedState(error: errorModel));
    }, (requestModelList) {
      if (requestModelList.length >= 10) {
        index++;
        orderList.addAll(requestModelList);
        emit(GetAllOrdersSucessState(orderList: requestModelList));
      } else {
        orderList.addAll(requestModelList);
        emit(GetAllOrdersSucessState(orderList: requestModelList));
        orderList.clear();
        index = 1;
      }
    });

    return orderList;
  }

  void deletePendingOrder({required int id}) async {
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repoAutomatic.deleteOrder(
      id: id,
    );
    response.fold((errorModel) {
      emit(ServiceRequestFailedState(error: errorModel));
    }, (requestModel) {
      emit(ServiceRequestSucessState(successMessage: requestModel));
    });
  }

  Future<String> getOrderSatus({required int id}) async {
    String status = '';
    emit(ServiceRequestIsLoadinState());
    dynamic response = await repoAutomatic.getOrderStatus(
      id: id,
    );
    response.fold((errorModel) {
      emit(ServiceRequestFailedState(error: errorModel));
    }, (requestModel) {
      status = requestModel;
      emit(ServiceRequestSucessState(successMessage: requestModel));
    });
    return status;
  }

  void handleAllRequestManualFunctions({required int requestType}) {
    if (requestType == 1) {
      switch (_serviceId) {
        case 1:
          createAutomaticRequestForWinch();
          break;
        case 2:
          createAutomaticRequestForTire();
          break;
        case 3:
          createAutomaticRequestForFuel();
          break;
        case 4:
          createAutomaticRequestForBatteries();
          break;
        case 5:
          createAutomaticRequestForOil();
        case 6:
          break;
        default:
      }
    } else {
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
}

ServiceRequestManualRepo makecontractbetweenaracticatureLayers() {
  ApiConsumer api = DioConsumer(dio: Dio());
  BaseServiceRequestManuallyRemoteDataSource dataSource =
      ServiceRequestManualRemoteDataSource(api: api);
  ServiceRequestManualRepo repo =
      ServiceRequestManualRepoImplamentation(dataSource: dataSource);
  return repo;
}

ServiceRequestAutomaticRepo makecontractbetweenaracticatureLayersAutomatic() {
  ApiConsumer api = DioConsumer(dio: Dio());
  BaseServiceRequestAutomaticRemoteDataSource dataSource =
      ServiceRequestAutomaticRemoteDataSource(api: api);
  ServiceRequestAutomaticRepo repo =
      ServiceRequestAutomaticRepoImplamentation(dataSource: dataSource);
  return repo;
}
