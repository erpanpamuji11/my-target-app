
import 'package:equatable/equatable.dart';

class Marketing extends Equatable {
  final String title;
  final String demografi;
  final String target;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime timeStamp;
  final String status;

  const Marketing(this.title, this.demografi, this.target, this.startDate,
      this.endDate, this.timeStamp, this.status);

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