import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/core/theme/padding_theme.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/domain/entities/address_entities.dart';
import 'package:woodman_project_fe/module/presentation/view/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_circular_button_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_loading_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_profile_info_widget.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_text_field_widget.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController posController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    numberController.dispose();
    addressController.dispose();
    cityController.dispose();
    countryController.dispose();
    posController.dispose();
    // Dispose of the controllers to free up resources
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProfileCubit>()
        ..getAddressUsercase().then((data) {
          nameController.text = data.name;
          numberController.text = data.phone;
          addressController.text = data.address;
          cityController.text = data.city;
          countryController.text = data.country;
          posController.text = data.postalCode;
        }),
      child: Builder(
        builder: (context) => _build(context),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Edit Addressx',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<EditProfileCubit, EditProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state.maybeWhen(
            initial: () => const MyLoadingWidget(),
            loading: () => const MyLoadingWidget(),
            error: (message) => Center(
              child: Text(message),
            ),
            orElse: () => const SizedBox(),
            loaded: (data) => _loaded(context, data),
          );
        },
      ),
    );
  }

  Widget _loaded(BuildContext context, AddressEntities data) {
    return SingleChildScrollView(
      child: Padding(
        padding: PaddingTheme.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // profile info
            const ProfileInfoWidget(
              username: 'admin',
              email: 'admin@email.com',
              avatarPath: 'asset/images/profile.jpg',
            ),
            const SizedBox(height: 40),
            Text(
              'Edit Address Information',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            // form
            // name
            MyTextFieldWidget(
              controller: nameController,
              hintText: 'Name Receiver',
              isPassword: false,
            ),
            const SizedBox(height: 24),
            // number
            MyTextFieldWidget(
              controller: numberController,
              hintText: 'Handphone Receiver',
              isPassword: false,
            ),
            const SizedBox(height: 24),
            // number
            MyTextFieldWidget(
              controller: addressController,
              hintText: 'Address',
              isPassword: false,
            ),
            const SizedBox(height: 24),

            MyTextFieldWidget(
              controller: cityController,
              hintText: 'City',
              isPassword: false,
            ),
            const SizedBox(height: 24),

            // number
            MyTextFieldWidget(
              controller: countryController,
              hintText: 'Country',
              isPassword: false,
            ),
            const SizedBox(height: 24),
            // number
            MyTextFieldWidget(
              controller: posController,
              hintText: 'Postal Code',
              isPassword: false,
            ),
            const SizedBox(height: 24),
            // button
            Align(
              alignment: Alignment.centerRight,
              child: MyCircularButtonWidget(
                onTap: () async {
                  final address = AddressEntities(
                    address: addressController.text,
                    city: cityController.text,
                    country: countryController.text,
                    postalCode: posController.text,
                    name: nameController.text,
                    phone: numberController.text,
                  );
                  final data = await context
                      .read<EditProfileCubit>()
                      .updateAddressUsercase(address);

                  if (data.address.isNotEmpty) {
                    addressController.text = data.address;
                    cityController.text = data.city;
                    countryController.text = data.country;
                    posController.text = data.postalCode;
                    nameController.text = data.name;
                    numberController.text = data.phone;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Address updated successfully!'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to update address!'),
                      ),
                    );
                  }
                },
                icon: Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
