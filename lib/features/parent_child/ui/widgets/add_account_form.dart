import 'package:flutter/material.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/parent_child/data/models/linked_account_model.dart';

import 'otp_verification_sheet.dart';

class AddAccountForm extends StatefulWidget {
  const AddAccountForm({super.key});

  @override
  State<AddAccountForm> createState() => _AddAccountFormState();
}

class _AddAccountFormState extends State<AddAccountForm> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildAvatar(),
          const SizedBox(height: 32),
          _buildTextField(
            controller: _nameController,
            label: 'Full Name',
            icon: Icons.person,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _linkAccount,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Send Verification Code',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey[200],
      child: Icon(Icons.person_add, size: 40, color: Colors.grey[600]),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? prefixText,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefixText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _linkAccount() async {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty) {
      _showSnack('Please fill all fields');
      return;
    }

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pop(context);
      _showOTPVerification();
    }
  }

  void _showOTPVerification() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => OTPVerificationSheet(
        username: _emailController.text,
        onVerified: () {
          // ignore: unused_local_variable
          final newAccount = LinkedAccountModel(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            name: _nameController.text,
            username: _emailController.text,
            avatarImage: null,
          );

          Navigator.of(context).pop(); // Close OTP sheet
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Account linked')),
          );
        },
      ),
    );
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }
}
