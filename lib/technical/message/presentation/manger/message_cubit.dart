import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/api/api_consumer.dart';
import 'package:splash_app/core/api/dio_api.dart';
import 'package:splash_app/technical/message/data/datasourse/message_remote_data_sourse.dart';
import 'package:splash_app/technical/message/data/rep_implimnation/message_repo_imlemntation.dart';
import 'package:splash_app/technical/message/domain/entity/message_entity.dart';
import 'package:splash_app/technical/message/domain/repo/message_repo.dart';
import 'package:splash_app/technical/message/domain/useCase/get_message_use_case.dart';
import 'package:splash_app/technical/message/presentation/manger/message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageState());

  Future<List<MessageEntity>> getMessage() async {
    MessageRepo messageRepo = triggerRepoMessage(); //
    emit(IsLoadingMessageState());

    dynamic response = await GetMessageUseCase(messageRepo: messageRepo).execute();

    return response.fold(
      (errorModel) {
        emit(FaliureMessageState(errorMessage: errorModel.errorMessage));
        return <MessageEntity>[];
        // return []; // Return an empty list to ensure a valid return type
      },
      (orderList) {
        emit(SuccessMessageState(orderList, successMessage: 'Success'));
        return orderList; // Return the fetched orders
      },
    );
  }
MessageRepo triggerRepoMessage() {
    ApiConsumer api = DioConsumer(dio: Dio());
    MessageRemoteDataSourse messageRemoteDataSourse = MessageRemoteDataSourse(api);
    return MessageRepoImlemntation(
        baseMessageRemoteDataSource: messageRemoteDataSourse);
  }
}
