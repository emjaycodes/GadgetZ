part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final Product _product;

  const AddToCartEvent(this._product);
  @override
  List<Object> get props => [_product];
}

class RemoveCartItemEvent extends CartEvent {
  final Product _product;

  const RemoveCartItemEvent(this._product);
  @override
  List<Object> get props => [_product];
}

class CartloadedEvent extends CartEvent {
  final List<Product> _cartItems;

  const CartloadedEvent(this._cartItems);

  @override
  List<Object> get props => [_cartItems];
}

class DecreaseCartItemQuantityEvent extends CartEvent {
  final Product product;

  const DecreaseCartItemQuantityEvent(this.product);
}

class IncreaseCartItemQuantityEvent extends CartEvent {
  final Product product;

  const IncreaseCartItemQuantityEvent(this.product);
}
