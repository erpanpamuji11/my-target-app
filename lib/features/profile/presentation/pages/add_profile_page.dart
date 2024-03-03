import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:my_terget_app/common/my_text_field.dart';
import 'package:my_terget_app/core/constants/constant_text.dart';
import 'package:my_terget_app/core/style/style_color.dart';
import 'package:my_terget_app/core/style/style_text.dart';
import 'package:my_terget_app/features/profile/data/models/profile_model.dart';
import 'package:my_terget_app/features/profile/presentation/blocs/profile/profile_bloc.dart';

class AddProfilePage extends StatelessWidget {
  AddProfilePage({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sectorController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    submitProfile() {
      context.read<ProfileBloc>().add(
            OnPostProfile(
              ProfileModel(_nameController.text, "null", _sectorController.text,
                  _valueController.text),
            ),
          );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          ConstantText.editProfile,
          style: b2Bold(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ConstantText.businessName,
                style: b2Bold(),
              ),
              const Gap(4),
              MyTextField(
                controller: _nameController,
                hintText: ConstantText.enterBusinessName,
              ),
              const Gap(12),
              Text(
                ConstantText.sectorBusiness,
                style: b2Bold(),
              ),
              const Gap(4),
              MyTextField(
                controller: _sectorController,
                hintText: ConstantText.enterBusinessSector,
              ),
              const Gap(12),
              Text(
                ConstantText.businessValue,
                style: b2Bold(),
              ),
              const Gap(4),
              MyTextField(
                controller: _valueController,
                hintText: ConstantText.enterBusinessValue,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            if (state is ProfileFailed) {
              const snackBar = SnackBar(
                content: Text("Add failed"),
                duration: Duration(seconds: 3),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ProfileEditSuccess) {
              context.pushReplacement('/home');
            }
          },
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () => submitProfile(),
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    ConstantText.submitText,
                    style: b2Medium(colorText: CustomColor.primary100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
