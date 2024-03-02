
import 'package:my_terget_app/features/business/domain/repositories/business_repository.dart';

class DeleteBusiness {
  final BusinessRepository businessRepository;

  DeleteBusiness(this.businessRepository);

  Future deleteBusiness(int index){
    return businessRepository.deleteBusiness(index);
  }
}