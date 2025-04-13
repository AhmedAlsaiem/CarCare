import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/core/error/exception.dart';
import 'package:splash_app/technical/message/data/datasourse/message_remote_data_sourse.dart';
import 'package:splash_app/technical/message/data/model/messsage_model.dart';
import 'package:splash_app/technical/message/domain/entity/message_entity.dart';
import 'package:splash_app/technical/message/domain/repo/message_repo.dart';

class MessageRepoImlemntation extends MessageRepo {
  BaseMessageRemoteDataSource baseMessageRemoteDataSource;

  MessageRepoImlemntation({required this.baseMessageRemoteDataSource});

  @override
  Future<Either<ErrorModel,List< MessageEntity>>> getMessages() async{


    try {
      List<MesssageModel> messageModel =
          await baseMessageRemoteDataSource.getMessages();

      return right(messageModel);
    } on ServerException catch (e) {
      return left(ErrorModel(
          statusCode: e.errModel.statusCode,
          errorMessage: e.errModel.errorMessage));
    }

  }
  
}
