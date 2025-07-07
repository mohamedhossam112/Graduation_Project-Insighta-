import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insighta/core/theming/colors.dart';

class OTPFields extends StatefulWidget {
  final OTPFieldsController controller;

  const OTPFields({super.key, required this.controller});

  @override
  State<OTPFields> createState() => _OTPFieldsState();
}

class _OTPFieldsState extends State<OTPFields> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    _controllers =
        List.generate(6, (_) => TextEditingController(), growable: false);
    _focusNodes = List.generate(6, (_) => FocusNode(), growable: false);
    widget.controller._attach(_controllers);
    super.initState();
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(6, (index) => _buildOTPField(index)),
    );
  }

  Widget _buildOTPField(int index) {
    return SizedBox(
      width: 45,
      height: 55,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: ColorsManager.primaryColor,
              width: 2,
            ),
          ),
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 5) {
            _focusNodes[index + 1].requestFocus();
          } else if (value.isEmpty && index > 0) {
            _focusNodes[index - 1].requestFocus();
          }
        },
      ),
    );
  }
}

class OTPFieldsController {
  late List<TextEditingController> _controllers;

  String get code =>
      _controllers.map((controller) => controller.text).join();

  void _attach(List<TextEditingController> controllers) {
    _controllers = controllers;
  }

  
}
