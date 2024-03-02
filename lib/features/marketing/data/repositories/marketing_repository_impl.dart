import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/exception.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/marketing/data/data_sources/marketing_data_source.dart';
import 'package:my_terget_app/features/marketing/data/models/marketing_model.dart';
import 'package:my_terget_app/features/marketing/domain/entities/marketing.dart';
import 'package:my_terget_app/features/marketing/domain/repositories/marketing_repository.dart';

class MarketingRepositoryImpl extends MarketingRepository {
  final MarketingDataSource marketingDataSource;

  MarketingRepositoryImpl(this.marketingDataSource);

  @override
  Future addMarketing(MarketingModel item) async {
    try {
      await marketingDataSource.addMarketing(item);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future deleteMarketing(int index) async {
    try {
      await marketingDataSource.deleteMarketing(index);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, List<Marketing>>> getMarketing() async {
    try {
      final data = await marketingDataSource.getMarketing();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure("Ada masalah sistem"));
    }
  }

  @override
  Future updateMarketing(int index, MarketingModel item) async {
    try {
      await marketingDataSource.updateMarketing(index, item);
    } catch (e) {
      throw ServerException();
    }
  }
}
