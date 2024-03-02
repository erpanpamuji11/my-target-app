
import 'package:dartz/dartz.dart';
import 'package:my_terget_app/core/error/exception.dart';
import 'package:my_terget_app/core/error/failure.dart';
import 'package:my_terget_app/features/profile/data/data_sources/profile_data_source.dart';
import 'package:my_terget_app/features/profile/data/models/profile_model.dart';
import 'package:my_terget_app/features/profile/domain/entities/profile.dart';
import 'package:my_terget_app/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSource profileDataSource;

  ProfileRepositoryImpl(this.profileDataSource);

  @override
  Future addProfile(ProfileModel item) async {
    try {
      await profileDataSource.addProfile(item);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future deleteProfile(int index) async {
    try {
      await profileDataSource.deleteProfile(index);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, Profile>> getProfile() async {
    try {
      final data = await profileDataSource.getProfile();
      return Right(data.toEntity());
    } catch (e) {
      return const Left(ServerFailure("Ada masalah sistem"));
    }
  }
}
