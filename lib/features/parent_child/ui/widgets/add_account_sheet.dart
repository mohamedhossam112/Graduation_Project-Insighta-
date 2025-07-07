import 'package:flutter/material.dart';
import 'package:insighta/features/parent_child/ui/widgets/add_account_form.dart';

class AddAccountSheet extends StatelessWidget {
  final Function onAccountAdded;

  const AddAccountSheet({super.key, required this.onAccountAdded});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: const [
          _SheetHandle(),
          SizedBox(height: 24),
          Text(
            'Link New Account',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 32),
          Expanded(child: AddAccountForm()),
        ],
      ),
    );
  }
}

class _SheetHandle extends StatelessWidget {
  const _SheetHandle();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
