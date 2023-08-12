import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:oga_bassey/services/payment_service.dart';

import '../../models/product.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  

  PaymentBloc() : super(PaymentInitialState()) {
    on<PaymentEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CardPaymentEvent>((event, emit) async {
      final PaystackPayment _payment = PaystackPayment(event.ctx, event.email, event.price);
       Charge charge = Charge()
    ..amount = event.price.toInt() * 100 // Paystack uses amount in kobo
    ..email = event.email;  
    final response = await _payment.chargeCardAndMakePayment();
  if (response.status) {
    // Payment successful
    emit(PaymentDoneState());
  } else {
    // Payment failed
    // emit(PaymentErrorState(''));
  }
    });

      // on<NavigateToPaymentPageEvent>((event, emit) {
      //   final Product selectedProduct = event.product;
      //   emit(PaymentInitialState());
      //   emit(PaymentNavigationState(selectedProduct));
      // });
  }
}
