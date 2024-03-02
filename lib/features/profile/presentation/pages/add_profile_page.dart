import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
              TextFormField(
                controller: _nameController,
                style: b2Bold(),
                decoration: InputDecoration(
                  hintText: ConstantText.enterBusinessName,
                  hintStyle: b2Reguler(),
                  filled: true,
                  fillColor: Colors.blue.withOpacity(0.2),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const Gap(12),
              Text(
                ConstantText.sectorBusiness,
                style: b2Bold(),
              ),
              const Gap(4),
              TextFormField(
                controller: _sectorController,
                style: b2Bold(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: ConstantText.enterBusinessSector,
                  hintStyle: b2Reguler(),
                  filled: true,
                  fillColor: Colors.blue.withOpacity(0.2),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const Gap(12),
              Text(
                ConstantText.businessValue,
                style: b2Bold(),
              ),
              const Gap(4),
              TextFormField(
                controller: _valueController,
                style: b2Bold(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: ConstantText.enterBusinessValue,
                  hintStyle: b2Reguler(),
                  filled: true,
                  fillColor: Colors.blue.withOpacity(0.2),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
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
