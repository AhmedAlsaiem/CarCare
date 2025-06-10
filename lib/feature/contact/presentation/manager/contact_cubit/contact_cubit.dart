import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/feature/contact/data/datasource/get_contact_remote_datasource.dart';
import 'package:splash_app/feature/contact/data/repo_implimentaition/contect_repo_implimentation.dart';
import 'package:splash_app/feature/contact/domain/usecases/contact_get_all_contact_usecase.dart';
import 'package:splash_app/feature/contact/presentation/manager/contact_cubit/contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(InitContactState());

  ContactGetAllContactUsecase contactGetAllContactUsecase =
      ContactGetAllContactUsecase(
          repo: ContectRepoImplimentation(
              baseGetContactRemoteDatasource: GetContactRemoteDatasource(
                  apiConsumer: DioConsumer(dio: Dio()))));
  Future<void> getAllContacts() async {
    emit(IsLoadingContactState());
    dynamic response = await contactGetAllContactUsecase.excute();
    response.fold(
        (errorModel) => emit(
              FailedContactState(errorMessage: errorModel.errorMessage),
            ), (contactList) {
      emit(
        SuccessContactState(contectList: contactList),
      );
    });
  }
}
