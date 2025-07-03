import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/core/utils/styles.dart';
import 'package:insighta/core/widgets/custom_back_button.dart';
import 'package:insighta/features/profile/logic/change_avatar_cubit/change_avatar_cubit.dart';
import 'package:insighta/features/profile/logic/change_avatar_cubit/change_avatar_state.dart';

import 'package:insighta/features/profile/ui/widgets/profile_screen_item.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomBackButton(),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Edit Profile', style: Styles.textStyle20P),
      ),
      body: BlocConsumer<ChangeAvatarCubit, ChangeAvatarState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (res) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(res.message)),
            ),
            error: (e) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.message.toString())),
            ),
          );
        },
        builder: (context, state) {
          final avatarUrl = state.maybeWhen(
            success: (res) => res.avatarUrl,
            orElse: () => null,
          );

          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h),
              child: Column(
                children: [
                  SizedBox(height: 24.h),
                  GestureDetector(
                    onTap: () async {
                      final picker = ImagePicker();
                      final picked =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (picked != null) {
                        final file = File(picked.path);
                        context.read<ChangeAvatarCubit>().uploadImage(
                              file,
                            );
                      }
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 50.r,
                            backgroundImage: avatarUrl != null
                                ? CachedNetworkImageProvider(avatarUrl)
                                : AssetImage('assets/images/profile_image.png')
                                    as ImageProvider,
                          ),
                        ),
                        Positioned(
                          bottom: -10,
                          right: 130,
                          child: IconButton(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final picked = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (picked != null) {
                                final file = File(picked.path);
                                context.read<ChangeAvatarCubit>().uploadImage(
                                      file,
                                    );
                              }
                            },
                            icon: Container(
                              decoration: BoxDecoration(
                                color: ColorsManager.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(6),
                              child: Icon(Icons.add_a_photo,
                                  color: Colors.white, size: 14.sp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (state is Loading) ...[
                    SizedBox(height: 16.h),
                    CircularProgressIndicator(),
                  ],
                  SizedBox(height: 16.h),
                  Center(
                    child: Text(
                      'Noha Elmahdy',
                      style: Styles.textStyle20P,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  ProfileScreenItem(
                    icon: Icons.person,
                    title: 'Change Name',
                    titleStyle: Styles.textStyle16I.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.black),
                    onTap: () {
                    
                    },
                  ),
                  SizedBox(height: 16.h),
                  ProfileScreenItem(
                    icon: Icons.delete_forever,
                    title: 'Delete Account',
                    titleStyle: Styles.textStyle16I.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.black),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
