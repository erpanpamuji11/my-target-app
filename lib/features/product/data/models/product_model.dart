// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/features/product/domain/entities/product.dart';
part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends Equatable {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final String weight;
  @HiveField(3)
  final DateTime startDate;
  @HiveField(4)
  final DateTime endDate;
  @HiveField(5)
  final DateTime timeStamp;
  @HiveField(6, defaultValue: "to do")
   String status;

  ProductModel(this.title, this.category, this.weight, this.startDate, this.endDate, this.timeStamp, this.status);

  Product toEntity() => Product(title, category, weight, startDate, endDate, timeStamp, status);
  
  @override
  List<Object?> get props => [title, category, weight, startDate, endDate, timeStamp, status];
}