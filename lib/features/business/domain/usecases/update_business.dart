
import 'package:my_terget_app/features/business/data/models/business_model.dart';
import 'package:my_terget_app/features/business/domain/repositories/business_repository.dart';

class UpdateBusiness {
  final BusinessRepository businessRepository;
  UpdateBusiness(this.businessRepository);

  Future updateBusiness(int index, BusinessModel item) {
    return businessRepository.updateBusiness(index, item);
  }
}