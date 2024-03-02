import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/exception.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/product/data/data_sources/product_datasource.dart';
import 'package:my_terget_app/features/product/data/models/product_model.dart';
import 'package:my_terget_app/features/product/domain/entities/product.dart';
import 'package:my_terget_app/features/product/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource productDataSource;

  ProductRepositoryImpl(this.productDataSource);

  @override
  Future addProduct(ProductModel item) async {
    try {
      await productDataSource.addProduct(item);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future deleteProduct(int index) async {
    try {
      await productDataSource.deleteProduct(index);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getProduct() async {
    try {
      final data = await productDataSource.getProduct();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure("Ada masalah sistem"));
    }
  }

  @override
  Future updateProduct(int index, ProductModel item) async {
    try {
      await productDataSource.updateProduct(index, item);
    } catch (e) {
      throw ServerException();
    }
  }
}
