import 'package:equatable/equatable.dart';

class ContactEntity extends Equatable {
  final int id;
  final String message;
  final String messageFor;
  final String createdBy;
  final String createdOn;
  final String lastModifiy;
  final String fullName;

  const ContactEntity({
    required this.id,
    required this.message,
    required this.messageFor,
    required this.createdBy,
    required this.createdOn,
    required this.lastModifiy,
    required this.fullName,
  });

  @override
  List<Object?> get props => [
        message,
        id,
        messageFor,
        createdBy,
        createdOn,
        lastModifiy,
        fullName,
      ];
}
