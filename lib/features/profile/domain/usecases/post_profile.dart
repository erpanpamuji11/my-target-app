
import 'package:my_terget_app/features/profile/data/models/profile_model.dart';
import 'package:my_terget_app/features/profile/domain/repositories/profile_repository.dart';

class PostProfile {
  final ProfileRepository profileRepository;
  PostProfile(this.profileRepository);

  Future addProfile(ProfileModel item) {
    return profileRepository.addProfile(item);
  }
}
