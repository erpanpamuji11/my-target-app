import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_terget_app/features/profile/data/models/profile_model.dart';
import 'package:my_terget_app/features/profile/domain/entities/profile.dart';
import 'package:my_terget_app/features/profile/domain/usecases/get_profile.dart';
import 'package:my_terget_app/features/profile/domain/usecases/post_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile getProfile;
  final PostProfile postProfile;
  
  ProfileBloc(this.getProfile, this.postProfile) : super(ProfileInitial()) {
    on<OnGetProfile>((event, emit) async {
      final result = await getProfile.getProfile();
      result.fold((l) => emit(ProfileFailed(l.message)), (r) {
        emit(ProfileLoaded(r));
        debugPrint(r.name);
      });
    });

    on<OnPostProfile>((event, emit) async {
      try {
        await postProfile.addProfile(event.profileModel);
        emit(ProfileEditSuccess());
      } catch (e){
        emit(ProfileFailed(e.toString()));
      }
    });
  }
}
