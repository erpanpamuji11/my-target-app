
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/exception.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/business/data/data_sources/business_data_source.dart';
import 'package:my_terget_app/features/business/data/models/business_model.dart';
import 'package:my_terget_app/features/business/domain/entities/business.dart';
import 'package:my_terget_app/features/business/domain/repositories/business_repository.dart';

class BusinessRepositoryImpl extends BusinessRepository {
  final BusinessDataSource businessDataSource;

  BusinessRepositoryImpl(this.businessDataSource);

  @override
  Future addBusiness(BusinessModel item) async {
    try {
      await businessDataSource.addBusiness(item);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future deleteBusiness(int index) async {
    try {
      await businessDataSource.deleteBusiness(index);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, List<Business>>> getBusiness() async {
    try {
      final data = await businessDataSource.getBusiness();
      return Right(data.map((e) => e.toEntity()).toList());
    } catch (e) {
      return const Left(ServerFailure("Ada masalah sistem"));
    }
  }

  @override
  Future updateBusiness(int index, BusinessModel item) async {
    try {
      await businessDataSource.updateBusiness(index, item);
    } catch (e) {
      throw ServerException();
    }
  }
}
