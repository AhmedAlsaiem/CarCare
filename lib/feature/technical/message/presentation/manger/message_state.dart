import 'package:splash_app/feature/technical/message/domain/entity/message_entity.dart';

 class MessageState {}



class IsLoadingMessageState extends MessageState {}

class SuccessMessageState extends MessageState {
  final List <MessageEntity> messages; // Store list of orders
  final String? successMessage;

  SuccessMessageState(this.messages, {this.successMessage});
}

class FaliureMessageState extends MessageState {
  final String errorMessage;

  FaliureMessageState({required this.errorMessage});
}