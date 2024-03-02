import 'package:my_terget_app/features/business/data/models/business_model.dart';
import 'package:my_terget_app/features/business/domain/repositories/business_repository.dart';

class PostBusiness {
  final BusinessRepository businessRepository;
  PostBusiness(this.businessRepository);

  Future addBusiness(BusinessModel item) {
    return businessRepository.addBusiness(item);
  }
}
