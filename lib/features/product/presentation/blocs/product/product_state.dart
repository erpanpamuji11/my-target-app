part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();
  
  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductFailed extends ProductState {
  final String message;

  const ProductFailed(this.message);
  @override
  List<Object> get props => [message];
}

final class ProductLoaded extends ProductState {
  final List<Product> products;

  const ProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}

final class ProductAddSuccess extends ProductState {}

final class ProductUpdateSuccess extends ProductState {}

final class ProductDeleteSuccess extends ProductState {}