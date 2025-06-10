import 'package:equatable/equatable.dart';

class FeadbackEntities extends Equatable {
  final double rating;
  final String comment;

  final int id;

  const FeadbackEntities({
    required this.rating,
    required this.comment,
    required this.id,
  });

  @override
  List<Object?> get props => [
        rating,
        comment,
        id,
      ];
}

class GetappFeadBackEntities extends Equatable {
  final double rateing;

  const GetappFeadBackEntities({
    required this.rateing,
    
  });

  @override
  List<Object?> get props => [
       rateing
      ];
}
