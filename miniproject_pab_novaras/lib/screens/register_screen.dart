import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  bool _isLoading = false;
  bool _obscure = true;
  bool _obscureConfirm = true;

  static const kDark = Color(0xFF1A1A2E);
  static const kAccent = Color(0xFFE07A5F);
  static const kMuted = Color(0xFF9A9A9A);

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    try {
      await supabase.auth.signUp(
        email: _emailCtrl.text.trim(),
        password: _passCtrl.text,
      );
      Get.back();
      Get.snackbar(
        'Registrasi Berhasil! 🎉',
        'Akun berhasil dibuat. Silahkan login.',
        backgroundColor: kDark,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        borderRadius: 14,
      );
    } catch (e) {
      Get.snackbar(
        'Registrasi Gagal',
        'Email mungkin sudah terdaftar.',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        borderRadius: 14,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? const Color(0xFF121212) : const Color(0xFFF5F0EB);
    final cardBg = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : kDark;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_rounded, color: textColor),
                ),
                const SizedBox(height: 16),
                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: textColor,
                    letterSpacing: -0.8,
                  ),
                ),
                // ignore: prefer_const_constructors
                Text(
                  'Start your journaling journey',
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontSize: 14, color: kMuted),
                ),
                const SizedBox(height: 32),

                _buildLabel('Email', textColor),
                const SizedBox(height: 6),
                _buildField(
                  controller: _emailCtrl,
                  hint: 'email@example.com',
                  cardBg: cardBg,
                  textColor: textColor,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => v!.isEmpty ? 'Masukkan email' : null,
                ),
                const SizedBox(height: 16),

                _buildLabel('Password', textColor),
                const SizedBox(height: 6),
                _buildField(
                  controller: _passCtrl,
                  hint: '••••••••',
                  cardBg: cardBg,
                  textColor: textColor,
                  obscure: _obscure,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscure
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: kMuted,
                      size: 20,
                    ),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                  validator: (v) =>
                      v!.length < 6 ? 'Minimal 6 karakter' : null,
                ),
                const SizedBox(height: 16),

                _buildLabel('Konfirmasi Password', textColor),
                const SizedBox(height: 6),
                _buildField(
                  controller: _confirmCtrl,
                  hint: '••••••••',
                  cardBg: cardBg,
                  textColor: textColor,
                  obscure: _obscureConfirm,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirm
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: kMuted,
                      size: 20,
                    ),
                    onPressed: () =>
                        setState(() => _obscureConfirm = !_obscureConfirm),
                  ),
                  validator: (v) => v != _passCtrl.text
                      ? 'Password tidak cocok'
                      : null,
                ),
                const SizedBox(height: 28),

                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kAccent,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2)
                        : const Text(
                            'Daftar Sekarang',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, Color textColor) => Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: textColor,
          letterSpacing: 0.4,
        ),
      );

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required Color cardBg,
    required Color textColor,
    TextInputType? keyboardType,
    bool obscure = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) =>
      Container(
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            // ignore: deprecated_member_use
            BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)
          ],
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboardType,
          style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFF9A9A9A)),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            suffixIcon: suffixIcon,
          ),
          validator: validator,
        ),
      );

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }
}