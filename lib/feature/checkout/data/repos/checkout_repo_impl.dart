import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:splash_app/core/api/stripe_api/stripe_service.dart';
import 'package:splash_app/core/error/error_model.dart';
import 'package:splash_app/feature/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<ErrorModel, void>> makePayment(
      {required String clientScret}) async {
    try {
      await stripeService.makePayment(clientSecret: clientScret);

      return right(null);
    } on StripeException catch (e) {
      return left(
        ErrorModel(
            errorMessage: e.error.message ?? 'Oops there was an error',
            statusCode: 400),
      );
    } catch (e) {
      return left(ErrorModel(errorMessage: e.toString(), statusCode: 400));
    }
  }
}
