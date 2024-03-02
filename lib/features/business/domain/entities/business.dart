import 'package:equatable/equatable.dart';

class Business extends Equatable {
  final String title;
  final String strategi;
  final String modal;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime timeStamp;
  final String status;

  Business(this.title, this.strategi, this.modal, this.startDate, this.endDate,
      this.timeStamp, this.status);

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
