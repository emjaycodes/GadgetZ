import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/product.dart';
import '../../repositories/product_repository.dart';
part 'like_product_event.dart';
part 'like_product_state.dart';

final ProductRepository _repository = ProductRepository();
late List<Product> likedProductList;

class LikedProductBloc extends Bloc<LikedProductEvent, LikedProductState> {
  LikedProductBloc() : super(LikeProductInitialState()) {
    on<LikedProductEvent>((event, emit) {});
    on<LikeProductEvent>((event, emit) {
      likedProductList = _repository.likedProduct;
      event.isLiked = true;
      likedProductList.add(event.product);
      emit(LikeProductLoadedState(likedProductList));
    });
    on<UnlikeProduct>((event, emit) {
      emit(LikeProductInitialState());
      _repository.deleteLikedProduct(event.product);
    });
  }
}
