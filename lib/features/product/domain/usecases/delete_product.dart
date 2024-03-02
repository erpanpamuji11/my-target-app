
import 'package:my_terget_app/features/product/domain/repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository productRepository;

  DeleteProduct(this.productRepository);

  Future deleteProduct(int index){
    return productRepository.deleteProduct(index);
  }
}