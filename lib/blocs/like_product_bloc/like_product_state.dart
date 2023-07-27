part of 'like_product_bloc.dart';

abstract class LikedProductState extends Equatable {
  const LikedProductState();

  @override
  List<Object> get props => [];
}

class LikeProductInitialState extends LikedProductState {}

class ProductlikedSuccess extends LikedProductState {
  final Product product;

   const ProductlikedSuccess(this.product );

  @override
  List<Object> get props => [product];
}

class LikeProductLoadedState extends LikedProductState {
  final List<Product> likedProductList;

  const LikeProductLoadedState(this.likedProductList);

  @override
  List<Object> get props => [likedProductList];
}
