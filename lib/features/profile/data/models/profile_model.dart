
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_terget_app/features/profile/domain/entities/profile.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 4)
class ProfileModel extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String sector;
  @HiveField(3)
  final String businessvalue;

  const ProfileModel(this.name, this.image, this.sector, this.businessvalue);

  Profile toEntity() => Profile(name, image, sector, businessvalue);
  
  @override
  List<Object?> get props => [name, image, sector, businessvalue];
}