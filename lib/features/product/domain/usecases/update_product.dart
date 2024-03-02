
import 'package:my_terget_app/features/product/data/models/product_model.dart';
import 'package:my_terget_app/features/product/domain/repositories/product_repository.dart';

class UpdateProduct {
  final ProductRepository productRepository;
  UpdateProduct(this.productRepository);

  Future updateProduct(int index, ProductModel item) {
    return productRepository.updateProduct(index, item);
  }
}