import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_terget_app/features/product/data/models/product_model.dart';
import 'package:my_terget_app/features/product/domain/entities/product.dart';
import 'package:my_terget_app/features/product/domain/usecases/delete_product.dart';
import 'package:my_terget_app/features/product/domain/usecases/get_product.dart';
import 'package:my_terget_app/features/product/domain/usecases/post_product.dart';
import 'package:my_terget_app/features/product/domain/usecases/update_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProduct getProduct;
  final PostProduct postProduct;
  final UpdateProduct updateProduct;
  final DeleteProduct deleteProduct;

  ProductBloc(
    this.getProduct,
    this.postProduct,
    this.updateProduct,
    this.deleteProduct,
  ) : super(ProductInitial()) {
    on<OnGetProduct>((event, emit) async {
      emit(ProductLoading());

      final result = await getProduct.getProduct();
      result.fold(
          (l) => emit(ProductFailed(l.message)), (r) => emit(ProductLoaded(r)));
    });

    on<OnAddProduct>((event, emit) async {
      try {
        await postProduct.addProduct(event.productModel);
        emit(ProductAddSuccess());
      } catch (e){
        emit(ProductFailed(e.toString()));
      }
    });

    on<OnUpdateProduct>((event, emit) async {
      try {
        await updateProduct.updateProduct(event.index, event.productModel);
        emit(ProductUpdateSuccess());
      } catch (e){
        emit(ProductFailed(e.toString()));
      }
      
    });

    on<OnDeleteProduct>((event, emit) async {
      try {
        await deleteProduct.deleteProduct(event.index);
        emit(ProductDeleteSuccess());
      } catch (e){
        emit(ProductFailed(e.toString()));
      }
      
    });
  }
}
