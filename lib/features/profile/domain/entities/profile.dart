import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final String name;
  final String image;
  final String sector;
  final String businessvalue;

  const Profile(this.name, this.image, this.sector, this.businessvalue);

  @override
  List<Object?> get props => [name, image, sector, businessvalue];
}
