
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/product/data/models/product_model.dart';
import 'package:my_terget_app/features/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProduct();
  Future addProduct(ProductModel item);
  Future updateProduct(int index, ProductModel item);
  Future deleteProduct(int index);
}