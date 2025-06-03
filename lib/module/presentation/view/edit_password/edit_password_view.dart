import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart';
import 'package:woodman_project_fe/di/injection.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart';

import 'cubit/edit_password_cubit.dart';

class EditPasswordView extends StatefulWidget {
  const EditPasswordView({super.key});

  @override
  State<EditPasswordView> createState() => _EditPasswordViewState();
}

class _EditPasswordViewState extends State<EditPasswordView> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final bool _obscureOldPassword = true;
  final bool _obscureNewPassword = true;
  final bool _obscureConfirmNewPassword = true;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditPasswordCubit>(),
      child: Builder(builder: (context) => _build(context)),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Password',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.5,
          foregroundColor: Colors.black87,
        ),
        body: BlocConsumer<EditPasswordCubit, EditPasswordState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => Container(),
              initial: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              loaded: (data) => _loaded(context),
              error: (message) => Center(
                child: Text(
                  message,
                  style: GoogleFonts.poppins(
                    fontSize: 16.0,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget _loaded(BuildContext context) {
    return Padding(
      // Gunakan Padding di sini
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Expanded(
            // Expanded untuk mengisi sisa ruang
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Kata Sandi Lama',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildPasswordField(
                      controller: _oldPasswordController,
                      hintText: 'Masukkan kata sandi lama Anda',
                      obscureText: _obscureOldPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kata sandi lama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Kata Sandi Baru',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildPasswordField(
                      controller: _newPasswordController,
                      hintText: 'Masukkan kata sandi baru Anda',
                      obscureText: _obscureNewPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Kata sandi baru tidak boleh kosong';
                        }
                        if (value.length < 6) {
                          return 'Kata sandi minimal 6 karakter';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Konfirmasi Kata Sandi Baru',
                      style: GoogleFonts.poppins(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    _buildPasswordField(
                      controller: _confirmNewPasswordController,
                      hintText: 'Konfirmasi kata sandi baru Anda',
                      obscureText: _obscureConfirmNewPassword,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Konfirmasi kata sandi tidak boleh kosong';
                        }
                        if (value != _newPasswordController.text) {
                          return 'Kata sandi baru tidak cocok';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          MyButtonWidget(
            onTap: () async {
              final message =
                  await context.read<EditPasswordCubit>().changePassword(
                        _oldPasswordController.text,
                        _newPasswordController.text,
                      );

              if (message.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Gagal mengubah kata sandi'),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            text: 'Update Password',
            radius: 8,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: GoogleFonts.poppins(fontSize: 15.0, color: Colors.black87),
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsTheme.blackColor,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: ColorsTheme.primaryColor,
          ),
        ),
        hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
      ),
      validator: validator,
    );
  }
}
