
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/marketing/domain/entities/marketing.dart';
import 'package:my_terget_app/features/marketing/domain/repositories/marketing_repository.dart';

class GetMarketing {
  final MarketingRepository marketingRepository;
  GetMarketing(this.marketingRepository);

  Future<Either<Failure, List<Marketing>>> getMarketing(){
    return marketingRepository.getMarketing();
  }
}