import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/core/error/exception.dart';
import 'package:my_terget_app/features/profile/data/models/profile_model.dart';

abstract class ProfileDataSource {
  Future<ProfileModel> getProfile();
  Future addProfile(ProfileModel item);
  Future deleteProfile(int index);
}

class ProfileDataSourceImpl extends ProfileDataSource {
  final String _boxName = "ProfileBox";

  Future<Box<ProfileModel>> get _box async =>
      await Hive.openBox<ProfileModel>(_boxName);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      var box = await _box;
      return box.values.first;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future addProfile(ProfileModel item) async {
    try {
      var box = await _box;
      await box.put(0,item);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future deleteProfile(int index) async {
    try {
      var box = await _box;
      await box.deleteAt(index);
    } catch (e) {
      throw ServerException();
    }
  }
}
