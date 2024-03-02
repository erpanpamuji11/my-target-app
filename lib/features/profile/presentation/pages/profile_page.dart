import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_terget_app/core/constants/constant_asset.dart';
import 'package:my_terget_app/core/constants/constant_text.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/profile/presentation/blocs/profile/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileBloc>(context).add(OnGetProfile());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          ConstantText.profile,
          style: b1Bold(),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileFailed) {
            return Column(
              children: [
                Center(
                  child: Text(state.message),
                ),
              ],
            );
          }
          if (state is ProfileLoaded) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: CustomColor.primary600,
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ConstantAsset.imgStore),
                        ),
                      ),
                    ),
                    const Gap(12),
                    Text(
                      state.profile.name,
                      style: b1Bold(),
                    ),
                    const Gap(12),
                    Text(
                      state.profile.sector,
                      style: b2Medium(),
                    ),
                    const Gap(12),
                    Text(
                      state.profile.businessvalue,
                      style: b2Medium(),
                    ),
                    const Gap(30),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {
                                context.push('/edit_profile');
                              },
                              child: Text(
                                ConstantText.editProfile,
                                style: b2Medium(),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
