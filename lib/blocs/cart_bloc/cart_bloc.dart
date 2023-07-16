import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/product.dart';
import '../../repositories/product_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

final ProductRepository _repository = ProductRepository();

List<Product> cartList = [];

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartEvent>((event, emit) {});
    on<AddToCartEvent>(_addToCartEvent);
    on<RemoveCartItemEvent>(_removeCartItemEvent);
    on<CartloadedEvent>((event, emit) {
      emit(CartloadedState(_repository.cartList));
    });
    on<IncreaseCartItemQuantityEvent>(((event, emit) {
      final product = event.product;
      final updatedProduct = Product(product.name, product.price, product.brand,
          product.description, product.quantity + 1);
      product.quantity++;
      emit(CartloadedState(_repository.cartList));
    }));
    on<DecreaseCartItemQuantityEvent>(((event, emit) {
      if (event.product.quantity > 0) {
        event.product.quantity--;
        // emit(_repository.updateCartItem(cartList[], updatedProduct))
        emit(CartloadedState(_repository.cartList));
      }
    }));
  }

  void _addToCartEvent(AddToCartEvent event, Emitter<CartState> emit) async {
    cartList = _repository.cartList;
    emit(CartInitialState());
    _repository.addToCart(event._product);
    emit(CartloadedState(cartList));
  }

  void _removeCartItemEvent(
      RemoveCartItemEvent event, Emitter<CartState> emit) async {
    emit(CartInitialState());
    _repository.removeFromCart(event._product);
  }
}



// void _IncreaseCartItemQuantity(
//     IncreaseCartItemQuantityEvent event, Emitter<CartState> emit) {}

// void _IecreaseCartItemQuantity(
//     DecreaseCartItemQuantityEvent event, Emitter<CartState> emit) {}
