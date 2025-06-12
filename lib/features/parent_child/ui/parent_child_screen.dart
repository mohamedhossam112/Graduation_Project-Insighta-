import 'package:flutter/material.dart';
import 'package:insighta/core/utils/styles.dart';

class ParentChildScreen extends StatelessWidget {
  const ParentChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          '  Linked Accounts',
          style: Styles.textStyle24P,
        ),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
