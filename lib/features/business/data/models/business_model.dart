import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/features/business/domain/entities/business.dart';
part 'business_model.g.dart';

@HiveType(typeId: 2)
class BusinessModel extends Equatable {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String strategi;
  @HiveField(2)
  final String modal;
  @HiveField(3)
  final DateTime startDate;
  @HiveField(4)
  final DateTime endDate;
  @HiveField(5)
  final DateTime timeStamp;
  @HiveField(6)
  final String status;

  BusinessModel(this.title, this.strategi, this.modal, this.startDate,
      this.endDate, this.timeStamp, this.status);

  Business toEntity() =>
      Business(title, strategi, modal, startDate, endDate, timeStamp, status);

  @override
  List<Object?> get props => [
        title,
        strategi,
        modal,
        startDate,
        endDate,
        timeStamp,
        status,
      ];
}
