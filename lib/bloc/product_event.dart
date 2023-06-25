part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class InitialEvent extends ProductEvent {
  InitialEvent();
}

class FetchProductsEvent extends ProductEvent {
  FetchProductsEvent();
}

class AddProductEvent extends ProductEvent {
  final Product _product;

  AddProductEvent(this._product);
  
  // Define the product getter
  Product get product => _product;
}
