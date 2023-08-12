part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class CardPaymentEvent extends PaymentEvent {
 final int price;
 final String email;
 BuildContext ctx;

   CardPaymentEvent(this.price, this.email, this.ctx); 
}

class NavigateToPaymentPageEvent extends PaymentEvent{
  final List<Product> product;

   NavigateToPaymentPageEvent(this.product);
}
