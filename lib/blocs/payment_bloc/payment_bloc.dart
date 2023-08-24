import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oga_bassey/blocs/location_bloc/location_bloc.dart';
import 'package:oga_bassey/services/payment_service.dart';

import '../../services/push_notification.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitialState()) {
    
  //   String getLocationFromBlocState() {
  //   final locationState = BlocProvider.of<LocationBloc>(context).state;
  //   if (locationState is LocationLoadedState) {
  //     return locationState.address; // Adjust this based on your actual LocationState
  //   }
  //   return 'Unknown Location'; // Default value if location isn't available
  // }

    on<PaymentEvent>((event, emit) {
      // TODO: implement event handler
      //jj
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

       // Send push notification for order in route
      // final user = FirebaseAuth.instance.currentUser;
      // final userEmail = user?.email;
      // if (userEmail != null) {
      //   final location = getLocationFromBlocState(); // Get the location from your LocationBloc
      //   final pushNotification = FirebasePushNotification();
      //   await pushNotification.sendOrderInRouteNotification(userEmail, location);
      // }
    });
  }
}