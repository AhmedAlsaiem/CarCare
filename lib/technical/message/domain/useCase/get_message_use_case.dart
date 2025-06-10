import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/technical/message/domain/entity/message_entity.dart';
import 'package:splash_app/technical/message/domain/repo/message_repo.dart';

class GetMessageUseCase {
  MessageRepo messageRepo;

  GetMessageUseCase({required this.messageRepo});

  Future<Either<ErrorModel, List<MessageEntity>>> execute() async {
    return await messageRepo.getMessages();
  }
}