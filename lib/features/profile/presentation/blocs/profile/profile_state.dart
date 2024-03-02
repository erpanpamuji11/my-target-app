part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
  
  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileFailed extends ProfileState {
  final String message;

  const ProfileFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class ProfileLoaded extends ProfileState {
  final Profile profile;

  const ProfileLoaded(this.profile);
  @override
  List<Object> get props => [profile];
}

final class ProfileEditSuccess extends ProfileState {}
