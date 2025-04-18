import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final int id;
  final String message;
  final String createdBy;
  final String createdOn;
  final String lastModifiedBy;
  final String lastModifiedon;

  final String userId;
  final String fullName;
  const MessageEntity(
      {required this.id,
      required this.message,
      required this.createdBy,
      required this.createdOn,
      required this.lastModifiedBy,
      required this.lastModifiedon,

      required this.userId,
      required this.fullName});
       @override
  List<Object?> get props => [
      id,
      message,
      createdBy,  
      createdOn,
      lastModifiedBy,
      userId,
      fullName
      ];
}
