
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/business/data/models/business_model.dart';
import 'package:my_terget_app/features/business/domain/entities/business.dart';

abstract class BusinessRepository {
  Future<Either<Failure, List<Business>>> getBusiness();
  Future addBusiness(BusinessModel item);
  Future updateBusiness(int index, BusinessModel item);
  Future deleteBusiness(int index);
}