import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oga_bassey/models/product.dart';
import 'package:oga_bassey/repositories/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
    final ProductRepository _repository = ProductRepository();

  final StreamController<List<Product>> _productController = StreamController<List<Product>>();

   Stream<List<Product>> get productStream => _productController.stream;

   void _handleFetchProductEvent(FetchProductsEvent event, Emitter<ProductState> emit )async{
     try {
        emit(ProductLoadingState());
     _repository.getProducts().listen((products){
        emit (ProductLoadedState(products));
      }, onError: (error){
        emit (ErrorProductState(error.toString()));
      }
      );
     } catch (error) {
       emit (ErrorProductState(error.toString()));
     }
    }
     
   void _handleAddProductEvent(AddProductEvent event, Emitter<ProductState> emit) async{
    emit(ProductLoadingState());
   await _repository.saveProduct(event.product).then((_) {
      emit(ProductAddedState());
    }, onError: (error) {
      emit(ErrorProductState(error.toString()));
    });
  }


  ProductBloc() : super(ProductInitialState()) {
      on<ProductEvent>((event, emit) {});

     on<FetchProductsEvent>((event, emit) => _handleFetchProductEvent(event, emit));

    on<AddProductEvent>((event, emit) => _handleAddProductEvent(event, emit));



    @override
      Future<void> close() {
        _productController.close();
        return super.close();
      }

  

  // void getProduct() {
  //   _repository.getProducts().listen((products) {
  //     _productController.add(products);
  //   });
  // }

  // Future<void> saveProduct(Product product) {
  //   return _repository.saveProduct(product);
  // }

  // void dispose() {
  //   _productController.close();
  }

  void getProduct() {}
}
