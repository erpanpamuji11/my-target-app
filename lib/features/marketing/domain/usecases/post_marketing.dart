import 'package:my_terget_app/features/marketing/data/models/marketing_model.dart';
import 'package:my_terget_app/features/marketing/domain/repositories/marketing_repository.dart';

class PostMarketing {
  final MarketingRepository marketingRepository;
  PostMarketing(this.marketingRepository);

  Future addMarketing(MarketingModel item) {
    return marketingRepository.addMarketing(item);
  }
}
