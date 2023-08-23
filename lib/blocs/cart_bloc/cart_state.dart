part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitialState extends CartState {}
class CartLoadingState extends CartState {}

class CartloadedState extends CartState {
  final List<Product> _cartList;

  get cartlist => _cartList;
  const CartloadedState(this._cartList);
  @override
  List<Object> get props => [_cartList];
}
