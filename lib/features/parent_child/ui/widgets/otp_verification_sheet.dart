import 'package:flutter/material.dart';
import 'package:insighta/core/theming/colors.dart';
import 'otp_fields.dart';

class OTPVerificationSheet extends StatefulWidget {
  final String username;
  final VoidCallback onVerified;

  const OTPVerificationSheet({
    super.key,
    required this.username,
    required this.onVerified,
  });

  @override
  State<OTPVerificationSheet> createState() => _OTPVerificationSheetState();
}

class _OTPVerificationSheetState extends State<OTPVerificationSheet> {
  late final OTPFieldsController _otpController;
  bool _isLoading = false;
  int _resendTimer = 60;

  @override
  void initState() {
    super.initState();
    _otpController = OTPFieldsController();
    _startResendTimer();
  }

  void _startResendTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted && _resendTimer > 0) {
        setState(() => _resendTimer--);
        _startResendTimer();
      }
    });
  }

  void _showSnack(String msg, [Color color = Colors.black]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: color,
    ));
  }

  void _resendCode() {
    setState(() => _resendTimer = 60);
    _startResendTimer();
    _showSnack('Verification code sent!');
  }

  Future<void> _verifyOTP() async {
    final otp = _otpController.code;
    if (otp.length != 6) {
      _showSnack('Please enter complete OTP');
      return;
    }

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pop(context);
      widget.onVerified();
      _showSnack('Account linked successfully!', Colors.green);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Enter Verification Code',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'We sent a code to ${widget.username}',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: OTPFields(controller: _otpController),
          ),
          const SizedBox(height: 32),
          Text(
            _resendTimer > 0
                ? 'Resend code in ${_resendTimer}s'
                : 'Didn\'t receive code?',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          if (_resendTimer == 0)
            TextButton(
              onPressed: _resendCode,
              child: Text(
                'Resend Code',
                style: TextStyle(
                  color: ColorsManager.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _verifyOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Verify & Link Account',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
