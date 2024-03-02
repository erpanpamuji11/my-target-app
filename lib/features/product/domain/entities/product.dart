import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Product extends Equatable {
  final String title;
  final String category;
  final String weight;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime timeStamp;
  String status;

  Product(
    this.title,
    this.category,
    this.weight,
    this.startDate,
    this.endDate,
    this.timeStamp,
    this.status,
  );
  
  @override
  List<Object?> get props => [title, category, weight, startDate, endDate, timeStamp, status];
}
