import 'dart:io';
// For File operations
import 'package:path/path.dart'; // For basename
import 'package:path_provider/path_provider.dart'; // For getApplicationDocumentsDirectory
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/core/helper/extenstion.dart';
import 'package:todo/core/helper/spacing.dart';

import '../../../core/constans/texts.dart';
import '../../../core/themes/my_colors.dart';
import '../../../domain/repositories/todo_usre_repo.dart';
import '../../../main.dart';

void showBottomDialogImage(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SizedBox(
        height: 150.h,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.center,
                child: Text(
                  Texts.editImageDialogTitle,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () async {
                  // Step 1: Retrieve image from picker

                  final XFile? image =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  appUserReady.value = false;
                  // Step 2: Check for valid file
                  if (image == null) return;

                  // Step 3: Get directory where we can duplicate selected file.
                  final String duplicateFilePath =
                      (await getApplicationDocumentsDirectory()).path;

                  // Step 4: Copy the file to the application document directory.
                  final String fileName = basename(image.path);

                  await File(image.path).copy('$duplicateFilePath/$fileName');

                  TodoUsreRepo().changeImage('$duplicateFilePath/$fileName');
                  context.pop();
                },
                child: Text(
                  Texts.takePic,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              ),
              verticalSpace(15),
              GestureDetector(
                onTap: () async {
                  // Step 1: Retrieve image from picker
                  final XFile? image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  appUserReady.value = false;
                  // Step 2: Check for valid file
                  if (image == null) return;

                  // Step 3: Get directory where we can duplicate selected file.
                  final String duplicateFilePath =
                      (await getApplicationDocumentsDirectory()).path;

                  // Step 4: Copy the file to the application document directory.
                  final String fileName = basename(image.path);
                  await File(image.path).copy('$duplicateFilePath/$fileName');

                  TodoUsreRepo().changeImage('$duplicateFilePath/$fileName');
                  context.pop();
                },
                child: Text(
                  Texts.importFromGallery,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
              )
            ],
          ),
        ),
      );
    },
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4),
      ),
    ),
    backgroundColor: MyColors.liteGray,
  );
}


// final ImagePicker picker = ImagePicker();
// // Pick an image.
// final XFile? image = await picker.pickImage(source: ImageSource.gallery);
// // Capture a photo.
// final XFile? photo = await picker.pickImage(source: ImageSource.camera);