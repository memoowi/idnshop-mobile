import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePictureCubit extends Cubit<XFile?> {
  final ImagePicker _picker = ImagePicker();

  ProfilePictureCubit() : super(null);

  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      final CroppedFile? croppedFile = await _cropImage(image.path);
      if (croppedFile != null) {
        emit(XFile(croppedFile.path));
      }
    }
  }

  Future<CroppedFile?> _cropImage(String path) async {
    var croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Edit Profile Picture',
          toolbarColor: Colors.white,
          toolbarWidgetColor: CustomColor.secondary1,
          statusBarColor: Colors.white,
          backgroundColor: CustomColor.secondary1,
          activeControlsWidgetColor: CustomColor.primary,
          dimmedLayerColor: CustomColor.primary.withOpacity(0.2),
          cropFrameStrokeWidth: 10,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
          showCropGrid: false,
        ),

        // for IOS not tested yet
        IOSUiSettings(
          title: 'Cropper',
        ),

        // for web not tested yet
        // WebUiSettings(
        //   context: context,
        //   presentStyle: CropperPresentStyle.dialog,
        //   boundary: const CroppieBoundary(
        //     width: 520,
        //     height: 520,
        //   ),
        //   viewPort:
        //       const CroppieViewPort(width: 480, height: 480, type: 'square'),
        //   enableExif: true,
        //   enableZoom: true,
        //   enforceBoundary: true,
        //   mouseWheelZoom: true,
        // ),
      ],
    );

    return croppedFile;
  }
}
