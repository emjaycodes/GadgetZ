part of 'payment_bloc.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
  
  @override
  List<Object> get props => [];
}

class PaymentInitialState extends PaymentState {}
class PaymentLoadingState extends PaymentState{}
class PaymentDoneState extends PaymentState{}

class PaymentErrorState extends PaymentState {
  final String error;

  PaymentErrorState(this.error);
}

// class PaymentNavigationState extends PaymentState{
//   final Product paymentProduct;

//   const PaymentNavigationState(this.paymentProduct);


//   @override
//   List<Object> get props => [paymentProduct];
// }