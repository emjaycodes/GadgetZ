part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

// bool? isLoaded;

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Product> products;

  ProductLoadedState(this.products);
}

class ErrorProductState extends ProductState {
  final String errorMessage;

  ErrorProductState(this.errorMessage);
}

class ProductAddedState extends ProductState {}
