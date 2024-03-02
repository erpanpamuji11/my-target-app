
import 'package:my_terget_app/features/profile/domain/repositories/profile_repository.dart';

class DeleteProfile {
  final ProfileRepository profileRepository;

  DeleteProfile(this.profileRepository);

  Future deleteProfile(int index){
    return profileRepository.deleteProfile(index);
  }
}