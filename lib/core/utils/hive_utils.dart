import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/features/business/data/models/business_model.dart';
import 'package:my_terget_app/features/marketing/data/models/marketing_model.dart';
import 'package:my_terget_app/features/product/data/models/product_model.dart';
import 'package:my_terget_app/features/profile/data/models/profile_model.dart';

class HiveUtils {
  Future<void> setupHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(BusinessModelAdapter());
    Hive.registerAdapter(MarketingModelAdapter());
    Hive.registerAdapter(ProfileModelAdapter());
  }
}
