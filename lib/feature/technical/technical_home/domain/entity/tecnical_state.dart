import 'package:equatable/equatable.dart';

class TecnicalStateEntity extends Equatable {
  final String message;

  const TecnicalStateEntity({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
