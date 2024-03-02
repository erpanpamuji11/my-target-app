import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/core/error/exception.dart';
import 'package:my_terget_app/features/marketing/data/models/marketing_model.dart';

abstract class MarketingDataSource {
  Future<List<MarketingModel>> getMarketing();
  Future addMarketing(MarketingModel item);
  Future updateMarketing(int index, MarketingModel item);
  Future deleteMarketing(int index);
}

class MarketingDataSourceImpl extends MarketingDataSource {
  final String _boxName = "marketingBox";

  Future<Box<MarketingModel>> get _box async =>
      await Hive.openBox<MarketingModel>(_boxName);

  @override
  Future<List<MarketingModel>> getMarketing() async {
    try {
      var box = await _box;
      return box.values.toList();
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future addMarketing(MarketingModel item) async {
    try {
      var box = await _box;
      await box.add(item);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future deleteMarketing(int index) async {
    try {
      var box = await _box;
      await box.deleteAt(index);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future updateMarketing(int index, MarketingModel item) async {
    try {
      var box = await _box;
      await box.putAt(index, item);
    } catch (e) {
      throw ServerException();
    }
  }
}
