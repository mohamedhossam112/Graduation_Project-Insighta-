// ignore_for_file: public_member_api_docs, sort_constructors_first
/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'package:insighta/core/theming/colors.dart';
import 'package:insighta/features/profile/logic/change_avatar_cubit/change_avatar_cubit.dart';
import 'package:insighta/features/profile/logic/change_avatar_cubit/change_avatar_state.dart';

class ChangePhotoWidget extends StatefulWidget {
  final String? currentImageUrl;
  const ChangePhotoWidget({
    Key? key,
    this.currentImageUrl,
  }) : super(key: key);

  @override
  State<ChangePhotoWidget> createState() => _ChangePhotoWidgetState();
}

class _ChangePhotoWidgetState extends State<ChangePhotoWidget> {
  File? _selectedImage;
  bool _isUpdating = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: ColorsManager.primaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.square,
            lockAspectRatio: true,
            showCropGrid: true,
          ),
          IOSUiSettings(
            title: 'Crop Image',
            aspectRatioLockEnabled: true,
            showCancelConfirmationDialog: true,
          ),
        ],
      );

      if (croppedFile != null) {
        setState(() {
          _selectedImage = File(croppedFile.path);
        });
      }
    }
  }

  Future<void> _saveImage() async {
    if (_selectedImage == null) return;

    setState(() {
      _isUpdating = true;
    });

    final cubit = BlocProvider.of<ChangeAvatarCubit>(context);
    await cubit.uploadImage(_selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangeAvatarCubit, ChangeAvatarState>(
      listener: (context, state) {
        if (_isUpdating) {
          state.maybeWhen(
            loading: () {},
            success: ( profile) {
              setState(() {
                _isUpdating = false;
              });
              
              Navigator.pop(context);
            },
            failure: (error) {
              setState(() {
                _isUpdating = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.getAllErrorMessages())),
              );
            },
            orElse: () {},
          );
        }
      },
      child: GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage: AssetImage('assets/images/profile_image.png'),
              ),
            ),
            Positioned(
                bottom: -10,
                right: 130,
                child: IconButton(
                  onPressed: () {},
                  icon: Container(
                    decoration: BoxDecoration(
                      color: ColorsManager.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 14.sp,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
*/
