part of 'product_bloc.dart';

 class ProductState extends Equatable {
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

class ProductDetailsState extends ProductState{
  final Product _productDetails;

  const ProductDetailsState(this._productDetails);


  @override
  List<Object> get props => [_productDetails];
}