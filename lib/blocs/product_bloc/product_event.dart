part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class InitialEvent extends ProductEvent {}

class FetchProductsEvent extends ProductEvent {}

class AddProductEvent extends ProductEvent {
  final Product _product;

  AddProductEvent(this._product);

  // Define the product getter
  Product get product => _product;
}


class NavigateToProductDetailsEvent extends ProductEvent{
  final Product product;

   NavigateToProductDetailsEvent(this.product);
}

class SortProductsEvent extends ProductEvent {
  final List<Product> sortedProducts;

  SortProductsEvent({required this.sortedProducts});
}

class SearchProductsEvent extends ProductEvent{
  final String query;

  SearchProductsEvent(this.query);
}