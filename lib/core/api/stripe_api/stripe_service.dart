import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:splash_app/feature/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:splash_app/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:splash_app/feature/checkout/data/models/payment_intent_model/payment_intent_model.dart' show PaymentIntentModel;

import 'stripe_api_service.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token:
          'sk_test_51QPMWrJqPNUV240JzufTLUMwySxKIj2qvEq3TqkJxH8AiZcxaPZQPOrDGN1lsBYjdyapxQKqQbGnTRVfmQrsTVol002h7hccfu',
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet({required String clientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: 'tharwat',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({required String clientSecret}) async {
    await initPaymentSheet(clientSecret: clientSecret);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.post(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token:
            'sk_test_51QPMWrJqPNUV240JzufTLUMwySxKIj2qvEq3TqkJxH8AiZcxaPZQPOrDGN1lsBYjdyapxQKqQbGnTRVfmQrsTVol002h7hccfu',
        headers: {
          'Authorization':
              "Bearer ${'sk_test_51QPMWrJqPNUV240JzufTLUMwySxKIj2qvEq3TqkJxH8AiZcxaPZQPOrDGN1lsBYjdyapxQKqQbGnTRVfmQrsTVol002h7hccfu'}",
          'Stripe-Version': '2023-08-16',
        });

    var ephermeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephermeralKey;
  }
}
