import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:oga_bassey/models/product.dart';
import 'package:oga_bassey/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductEvent>((event, emit) {});

    on<FetchProductsEvent>(_handleFetchProductEvent);

    // on<AddProductEvent>(_handleAddProductEvent);

    on<NavigateToProductDetailsEvent>((event, emit) {
      final Product selectedProduct = event.product;
      emit(ProductInitialState());
      emit(ProductDetailsState(selectedProduct));
    });
  }

  final ProductRepository _repository = ProductRepository();

  /// For debugging purposes.
  @override
  void onChange(Change<ProductState> change) {
    print('OBSERVED CHANGE IN PRODUCTBLOC: $change');
    super.onChange(change);
  }

  List<Product> products = [];

  Future<void> _handleFetchProductEvent(
      FetchProductsEvent event, Emitter<ProductState> emit) async {
    try {
      emit(ProductLoadingState());
      await for (List<Product> products in _repository.getProducts()) {
        emit(ProductsUpdatedState(products));
      }
    } catch (error) {
      emit(ProductErrorState(error.toString()));
    }
  }

  // void _handleAddProductEvent(
  //     AddProductEvent event, Emitter<ProductState> emit) async {
  //   emit(ProductLoadingState());
  //   await _repository.saveProduct(event.product).then(
  //     (_) {
  //       // emit(ProductAddedState());
  //     },
  //     onError: (error) {
  //       emit(ProductErrorState(error.toString()));
  //     },
  //   );
  // }
}
