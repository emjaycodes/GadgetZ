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
      final Stream<List<Product>> productStream = _repository.getProducts();
       productStream.listen((List<Product> products) {
        emit(CartloadedState(products));
      });
      emit(CartloadedState(_repository.cartList));
    });
    on<IncreaseCartItemQuantityEvent>(((event, emit) {
       // loading items
       emit(CartLoadingState());
      final product = event.product;
      product.quantity++;
      emit(CartloadedState(_repository.cartList));
    }));

    on<DecreaseCartItemQuantityEvent>(((event, emit) {
      print('before decrease: ${event.product.quantity}'); 
       // loading items
        emit(CartLoadingState());
         if (event.product.quantity >= 1) {
        event.product.quantity--;
        print('After decrease: ${event.product.quantity}'); 
        emit(CartloadedState(_repository.cartList));
      } else if (event.product.quantity == 0){
          _repository.removeFromCart(event.product);
          emit(CartloadedState(_repository.cartList));
      }
    }));
  }

  void _addToCartEvent(AddToCartEvent event, Emitter<CartState> emit){
    // loading items
    emit(CartLoadingState());
    final product = event._product;
  final int productIndex = _repository.cartList.indexWhere((cartProduct) => cartProduct.id == product.id);
    cartList = _repository.cartList;
    emit(CartInitialState());
    if (productIndex != -1) {
    // If the product is already in the cart, update its quantity
    _repository.cartList[productIndex].quantity += 1;
  } else {
    // If the product is not in the cart, add it to the cart list
    product.quantity = 1;
    _repository.addToCart(product);
  }

    // _repository.addToCart(event._product);
    emit(CartloadedState(cartList));
  }

  void _removeCartItemEvent(
      RemoveCartItemEvent event, Emitter<CartState> emit){
    emit(CartInitialState());
     // loading items
    emit(CartLoadingState());
    _repository.removeFromCart(event._product);
  }
}

