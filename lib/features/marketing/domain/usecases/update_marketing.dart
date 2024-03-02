import 'package:my_terget_app/features/marketing/data/models/marketing_model.dart';
import 'package:my_terget_app/features/marketing/domain/repositories/marketing_repository.dart';

class UpdateMarketing {
  final MarketingRepository marketingRepository;
  UpdateMarketing(this.marketingRepository);

  Future updateMarketing(int index, MarketingModel item) {
    return marketingRepository.updateMarketing(index, item);
  }
}
