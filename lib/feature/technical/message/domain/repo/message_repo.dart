import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/technical/message/domain/entity/message_entity.dart';

abstract class MessageRepo {
  Future <Either<ErrorModel ,List< MessageEntity>>> getMessages();
}