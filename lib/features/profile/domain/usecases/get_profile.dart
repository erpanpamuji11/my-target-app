
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/profile/domain/entities/profile.dart';
import 'package:my_terget_app/features/profile/domain/repositories/profile_repository.dart';

class GetProfile {
  final ProfileRepository profileRepository;
  GetProfile(this.profileRepository);

  Future<Either<Failure, Profile>> getProfile(){
    return profileRepository.getProfile();
  }
}