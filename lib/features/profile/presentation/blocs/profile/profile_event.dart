part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class OnGetProfile extends ProfileEvent {}

class OnPostProfile extends ProfileEvent {
  final ProfileModel profileModel;

  const OnPostProfile(this.profileModel);

  @override
  List<Object> get props => [profileModel];
}