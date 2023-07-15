part of 'like_product_bloc.dart';

abstract class LikedProductState extends Equatable {
  const LikedProductState();

  @override
  List<Object> get props => [];
}

class LikeProductInitialState extends LikedProductState {}

class LikeProductLoadedState extends LikedProductState {
  final List<Product> likedProductList;

  const LikeProductLoadedState(this.likedProductList);

  @override
  List<Object> get props => [likedProductList];
}
