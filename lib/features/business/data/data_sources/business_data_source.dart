
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/core/error/exception.dart';
import 'package:my_terget_app/features/business/data/models/business_model.dart';

abstract class BusinessDataSource {
  Future<List<BusinessModel>> getBusiness();
  Future addBusiness(BusinessModel item);
  Future updateBusiness(int index, BusinessModel item);
  Future deleteBusiness(int index);
}

class BusinessDataSourceImpl extends BusinessDataSource {
  final String _boxName = "businessBox";

  Future<Box<BusinessModel>> get _box async =>
      await Hive.openBox<BusinessModel>(_boxName);

  @override
  Future<List<BusinessModel>> getBusiness() async {
    try {
      var box = await _box;
      return box.values.toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future addBusiness(BusinessModel item) async {
    try {
      var box = await _box;
      await box.add(item);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future deleteBusiness(int index) async {
    try {
      var box = await _box;
      await box.deleteAt(index);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future updateBusiness(int index, BusinessModel item) async {
    try {
      var box = await _box;
      await box.putAt(index, item);
    } catch (e) {
      throw ServerException();
    }
  }
}
