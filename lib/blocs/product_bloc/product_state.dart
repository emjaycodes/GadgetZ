part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductInitialState extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductsUpdatedState extends ProductState {
  final List<Product> products;

  const ProductsUpdatedState(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductErrorState extends ProductState {
  final String? errorMessage;

  const ProductErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
