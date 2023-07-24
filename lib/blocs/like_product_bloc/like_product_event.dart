part of 'like_product_bloc.dart';

abstract class LikedProductEvent extends Equatable {
  const LikedProductEvent();

  @override
  List<Object> get props => [];
}

class LikeProductEvent extends LikedProductEvent {
  final Product product;
   bool isLiked = false;

    LikeProductEvent(this.product, this.isLiked);

   @override
  List<Object> get props => [product];
}

class UnlikeProduct extends LikedProductEvent {
  final Product product;
   final bool isLiked;

  const UnlikeProduct(this.product, this.isLiked);

   @override
  List<Object> get props => [product];
}
