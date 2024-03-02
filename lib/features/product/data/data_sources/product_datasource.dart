import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/core/error/exception.dart';
import 'package:my_terget_app/features/product/data/models/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getProduct();
  Future addProduct(ProductModel item);
  Future updateProduct(int index, ProductModel item);
  Future deleteProduct(int index);
}

class ProductDataSourceImpl extends ProductDataSource {
  final String _boxName = "productBox";

  Future<Box<ProductModel>> get _box async =>
      await Hive.openBox<ProductModel>(_boxName);

  @override
  Future<List<ProductModel>> getProduct() async {
    try {
      var box = await _box;
      return box.values.toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future addProduct(ProductModel item) async {
    try {
      var box = await _box;
      await box.add(item);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future deleteProduct(int index) async {
    try {
      var box = await _box;
      await box.deleteAt(index);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future updateProduct(int index, ProductModel item) async {
    try {
      var box = await _box;
      await box.putAt(index, item);
    } catch (e) {
      throw ServerException();
    }
  }
}
