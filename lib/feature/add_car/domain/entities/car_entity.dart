import 'package:equatable/equatable.dart';

class CarEntity extends Equatable {
  final String model;
  final int id;
  final String color;
  final int year;
  final String vinNumber;
  final String plateNumber;
  
 

  const CarEntity({
    required this.model,
    required this.id,
    required this.color,
    required this.year,
    required this.vinNumber,
    required this.plateNumber,
  });

  @override
  List<Object?> get props => [
        model,
        id,
        color,
        year,
        vinNumber,
        plateNumber,
      ];
}
