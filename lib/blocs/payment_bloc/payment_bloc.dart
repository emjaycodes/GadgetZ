import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:oga_bassey/services/payment_service.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitialState()) {
    on<PaymentEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<CardPaymentEvent>((event, emit)async{
      emit(PaymentLoadingState());
      final PaystackPayment payment = PaystackPayment(event.ctx, event.email, event.price);
      try{
        await payment.initializePlugin(); // Initialize the Paystack plugin
        await payment.chargeCardAndMakePayment(); 
        emit(PaymentDoneState());
      } catch (e){
        emit(PaymentErrorState('An error occurred during payment ${e.toString()}'));
      }
    });
  }
}