
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/business/domain/entities/business.dart';
import 'package:my_terget_app/features/business/domain/repositories/business_repository.dart';

class GetBusiness {
  final BusinessRepository businessRepository;
  GetBusiness(this.businessRepository);

  Future<Either<Failure, List<Business>>> getBusiness(){
    return businessRepository.getBusiness();
  }
}