import 'package:my_terget_app/features/product/data/models/product_model.dart';
import 'package:my_terget_app/features/product/domain/repositories/product_repository.dart';

class PostProduct {
  final ProductRepository productRepository;
  PostProduct(this.productRepository);

  Future addProduct(ProductModel item) {
    return productRepository.addProduct(item);
  }
}
