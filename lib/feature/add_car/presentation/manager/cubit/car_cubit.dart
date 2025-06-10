import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/add_car/data/datasource/car_remote_datasource.dart';
import 'package:splash_app/feature/add_car/data/repo_implimentation/car_repo_implimentation.dart';
import 'package:splash_app/feature/add_car/domain/entities/car_entity.dart';
import 'package:splash_app/feature/add_car/domain/repo/car_repo.dart';
import 'package:splash_app/feature/add_car/domain/usecases/care_usecases/create_car_usecase.dart';
import 'package:splash_app/feature/add_car/domain/usecases/care_usecases/delete_car_usecase.dart';
import 'package:splash_app/feature/add_car/domain/usecases/care_usecases/get_car_for_specific_user_usecase.dart';
import 'package:splash_app/feature/add_car/presentation/manager/cubit/car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit() : super(CarState());
  // Keys
  GlobalKey<FormState> verifcationCodeKey = GlobalKey();

//? controllers
  TextEditingController model = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController vinNumber = TextEditingController();
  TextEditingController plateN1 = TextEditingController();
  TextEditingController plateN2 = TextEditingController();
  TextEditingController plateN3 = TextEditingController();
  TextEditingController plateChar = TextEditingController();


  // void setCarInfo({required String brand, required String carColor, required String plate}) {
  //   model.text = brand;
  //   color.text = carColor;
  //   year.text = ''; // You can infer year from plate or leave empty
  // }
  CarRepo repo = CarRepoImplimentation(
      carBaseRemoteDataSource:
          CarRemoteDatasource(api: DioConsumer(dio: Dio())));
  List<CarEntity> userCarList = [];
  Future<void> createCar() async {
    emit(IsLoadingCarState());
    dynamic response = await CreateCarUsecase(repo: repo).execute(
      model: model.text,
      color: color.text,
      year: int.parse(year.text),
      vinNumber: vinNumber.text,
      plateNumber:
          (plateN1.text + plateN2.text + plateN3.text + plateChar.text),
    );
    response.fold(
        (errorModel) =>
            emit(FaliureCarState(errorMessage: errorModel.errorMessage)),
        (responseModel) {
      return emit(SuccessCarState('sucess'));
    });
  }

  Future<void> getAllCarsForSepecificUser() async {
    userCarList.clear();

    emit(IsLoadingCarState());
    dynamic response = await GetCarForSpecificUserUsecase(repo: repo).excute();

    response.fold(
        (errorModel) =>
            emit(FaliureCarState(errorMessage: errorModel.errorMessage)),
        (carList) {
      userCarList.addAll(carList);
      return emit(SuccessGetCarState(carList));
    });
  }

  Future<void> deleteCarById({required int id}) async {
    emit(IsLoadingCarState());
    dynamic response = await DeleteCarUsecase(repo: repo).excute(id: id);
    response.fold(
        (errorModel) =>
            emit(FaliureCarState(errorMessage: errorModel.errorMessage)),
        (sucess) {
      getAllCarsForSepecificUser();
      return emit(SuccessCarState('sucess'));
    });
  }
}
