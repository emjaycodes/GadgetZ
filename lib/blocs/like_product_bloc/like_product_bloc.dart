import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'like_product_event.dart';
part 'like_product_state.dart';

class LikeProductBloc extends Bloc<LikeProductEvent, LikeProductState> {
  LikeProductBloc() : super(LikeProductInitial()) {
    on<LikeProductEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
