import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_app/feature/checkout/data/models/payment_intent_input_model.dart';
import 'package:splash_app/feature/checkout/data/repos/checkout_repo.dart';
import 'package:splash_app/feature/paid_services/presentation/manager/service_request_manual_cubit/service_request_manual_cubit.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.checkoutRepo) : super(PaymentInitial());
  final CheckoutRepo checkoutRepo;

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(PaymentLoading());

    var data = await checkoutRepo.makePayment(
        clientScret: ServiceRequestManualCubit.requestEntity!.clientSecret);

    data.fold((l) {
      print(l.errorMessage);
      emit(PaymentFailure(l.errorMessage));
    }, (r) {
      emit(
        PaymentSuccess(),
      );
    });
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
