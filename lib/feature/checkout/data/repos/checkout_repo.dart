import 'package:dartz/dartz.dart';
import 'package:splash_app/core/error/error_model.dart';

abstract class CheckoutRepo {
  Future<Either<ErrorModel, void>> makePayment(
      {required String clientScret});
}
