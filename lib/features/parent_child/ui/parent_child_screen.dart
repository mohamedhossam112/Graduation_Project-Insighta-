import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';

import 'package:insighta/features/parent_child/data/models/linked_account_model.dart';
import 'package:insighta/features/parent_child/ui/widgets/account_list_item.dart';
import 'package:insighta/features/parent_child/ui/widgets/add_account_sheet.dart';

/*class ParentChildScreen extends StatelessWidget {
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
}*/

class ParentChildScreen extends StatefulWidget {
  const ParentChildScreen({super.key});

  @override
  State<ParentChildScreen> createState() => _ParentChildScreenState();
}

class _ParentChildScreenState extends State<ParentChildScreen> {
  final List<LinkedAccountModel> accounts = [
    const LinkedAccountModel(
      id: '1',
      name: 'John Doe',
      username: '@johndoe',
      avatarImage: 'assets/images/img.png',
    ),
    const LinkedAccountModel(
      id: '2',
      name: 'Sarah Smith',
      username: '@sarahsmith',
      avatarImage: 'assets/images/img2.png',
    ),
    const LinkedAccountModel(
      id: '3',
      name: 'Mike Johnson',
      username: '@mikej',
      avatarImage: 'assets/images/img3.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Linked Accounts',
          style: Styles.textStyle24P,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: ColorsManager.primaryColor,
              size: 30.sp,
            ),
            onPressed: () => _showAddAccountSheet(),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: accounts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, index) {
          final account = accounts[index];
          return AccountListItem(
              account: account,
              onTap: () {
                Navigator.pushNamed(context, Routes.linkedAccountReportScreen,
                    arguments: account);
              });
        },
      ),
    );
  }

  void _showAddAccountSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddAccountSheet(
        onAccountAdded: (newAccount) {
          setState(() {
            accounts.add(newAccount);
          });
        },
      ),
    );
  }

  void _navigateTo(
      BuildContext context, String route, LinkedAccountModel account) {
    Navigator.pushNamed(context, route, arguments: account);
  }
}
