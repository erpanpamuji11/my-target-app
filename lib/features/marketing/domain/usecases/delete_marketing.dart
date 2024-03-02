import 'package:my_terget_app/features/marketing/domain/repositories/marketing_repository.dart';

class DeleteMarketing {
  final MarketingRepository marketingRepository;

  DeleteMarketing(this.marketingRepository);

  Future deleteMarketing(int index) {
    return marketingRepository.deleteMarketing(index);
  }
}
