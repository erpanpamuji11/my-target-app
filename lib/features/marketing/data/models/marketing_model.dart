import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/features/marketing/domain/entities/marketing.dart';
part 'marketing_model.g.dart';

@HiveType(typeId: 3)
class MarketingModel extends Equatable {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String demografi;
  @HiveField(2)
  final String target;
  @HiveField(3)
  final DateTime startDate;
  @HiveField(4)
  final DateTime endDate;
  @HiveField(5)
  final DateTime timeStamp;
  @HiveField(6)
  final String status;

  const MarketingModel(this.title, this.demografi, this.target, this.startDate,
      this.endDate, this.timeStamp, this.status);

  Marketing toEntity() => Marketing(
        title,
        demografi,
        target,
        startDate,
        endDate,
        timeStamp,
        status,
      );

  @override
  List<Object?> get props => [
        title,
        demografi,
        target,
        startDate,
        endDate,
        timeStamp,
        status,
      ];
}
