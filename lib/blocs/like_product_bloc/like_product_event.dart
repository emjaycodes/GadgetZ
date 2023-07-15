part of 'like_product_bloc.dart';

abstract class LikedProductEvent extends Equatable {
  const LikedProductEvent();

  @override
  List<Object> get props => [];
}

class LikeProductEvent extends LikedProductEvent {
  final Product product;

  const LikeProductEvent(this.product);

   @override
  List<Object> get props => [product];
}

class UnlikeProduct extends LikedProductEvent {
  final Product product;

  const UnlikeProduct(this.product);

   @override
  List<Object> get props => [product];
}
