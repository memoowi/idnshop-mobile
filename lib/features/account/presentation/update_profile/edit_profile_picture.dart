import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:idnshop/core/theme/custom_color.dart';
import 'package:idnshop/features/account/bloc/profile_pciture_cubit.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePicture extends StatelessWidget {
  const EditProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.lightGrey,
      appBar: AppBar(
        title: const Text('Edit Profile Picture'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                clipBehavior: Clip.hardEdge,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: Row(
                          children: [
                            Text(
                              'Edit Profile Image',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          context
                              .read<ProfilePictureCubit>()
                              .pickImage(ImageSource.camera);
                          Navigator.of(context).pop();
                        },
                        leading: const Icon(CupertinoIcons.camera),
                        iconColor: CustomColor.primary,
                        title: Text(
                          'Take a picture',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          context
                              .read<ProfilePictureCubit>()
                              .pickImage(ImageSource.gallery);
                          Navigator.of(context).pop();
                        },
                        leading: const Icon(CupertinoIcons.photo_on_rectangle),
                        iconColor: CustomColor.primary,
                        title: Text(
                          'Choose from gallery',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.edit_outlined,
              color: CustomColor.secondary1,
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: BlocBuilder<ProfilePictureCubit, XFile?>(
        builder: (context, image) {
          return Center(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.white,
                child: image == null
                    ? const Icon(
                        CupertinoIcons.person_fill,
                        color: CustomColor.primary,
                        size: 100,
                      )
                    : Image.file(File(image.path)),
              ),
            ),
          );
        },
      ),
    );
  }
}
