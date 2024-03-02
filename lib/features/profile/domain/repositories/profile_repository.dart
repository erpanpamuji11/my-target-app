
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/profile/data/models/profile_model.dart';
import 'package:my_terget_app/features/profile/domain/entities/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getProfile();
  Future addProfile(ProfileModel item);
  Future deleteProfile(int index);
}