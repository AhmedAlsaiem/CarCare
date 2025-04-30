
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/core/widgets/custom_text_button.dart';
import 'package:splash_app/feature/checkout/data/models/payment_intent_input_model.dart' show PaymentIntentInputModel;
import 'package:splash_app/feature/checkout/presentation/manger/cubit/payment_cubit.dart';
import 'package:splash_app/feature/checkout/presentation/views/thank_you_view.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
  });

  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onPressed: () {
              if (isPaypal) {
              } else {
                excuteStripePayment(context);
              }
            },
            bottonName: 'Continue');
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      cusomerId: 'cus_Onu3Wcrzhehlez',
    );
    BlocProvider.of<PaymentCubit>(context)
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }
}
