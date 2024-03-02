
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/product/domain/entities/product.dart';
import 'package:my_terget_app/features/product/domain/repositories/product_repository.dart';

class GetProduct {
  final ProductRepository productRepository;
  GetProduct(this.productRepository);

  Future<Either<Failure, List<Product>>> getProduct(){
    return productRepository.getProduct();
  }
}