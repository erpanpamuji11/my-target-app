part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class OnGetProduct extends ProductEvent {
}

class OnAddProduct extends ProductEvent {
  final ProductModel productModel;

  const OnAddProduct(this.productModel);

  @override
  List<Object> get props => [productModel];
}

class OnUpdateProduct extends ProductEvent {
  final ProductModel productModel;
  final int index;

  const OnUpdateProduct(this.productModel, this.index);

  @override
  List<Object> get props => [productModel, index];
}

class OnDeleteProduct extends ProductEvent {
  final int index;

  const OnDeleteProduct(this.index);
  @override
  List<Object> get props => [index];
}
