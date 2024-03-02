
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/marketing/data/models/marketing_model.dart';
import 'package:my_terget_app/features/marketing/domain/entities/marketing.dart';

abstract class MarketingRepository {
  Future<Either<Failure, List<Marketing>>> getMarketing();
  Future addMarketing(MarketingModel item);
  Future updateMarketing(int index, MarketingModel item);
  Future deleteMarketing(int index);
}