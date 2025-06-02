import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:woodman_project_fe/core/theme/colors_theme.dart';
import 'package:woodman_project_fe/module/presentation/widged/my_button_widget.dart';

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

  bool _obscureOldPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmNewPassword = true;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmNewPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      // Logika untuk mengubah kata sandi

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Password berhasil diubah!',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
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
                        toggleObscureText: () {
                          setState(() {
                            _obscureOldPassword = !_obscureOldPassword;
                          });
                        },
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
                        toggleObscureText: () {
                          setState(() {
                            _obscureNewPassword = !_obscureNewPassword;
                          });
                        },
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
                        toggleObscureText: () {
                          setState(() {
                            _obscureConfirmNewPassword =
                                !_obscureConfirmNewPassword;
                          });
                        },
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
              onTap: () => _changePassword(),
              text: 'Update Password',
              radius: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool obscureText,
    required VoidCallback toggleObscureText,
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
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: toggleObscureText,
        ),
      ),
      validator: validator,
    );
  }
}
