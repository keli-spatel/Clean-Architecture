import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

Future<List<File>> pickImages() async {
  List<File> images = [];
  try{
    final FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (pickedFiles != null && pickedFiles.files.isNotEmpty) {
      for (int i = 0; i < pickedFiles.files.length; i++) {
        images.add(
          File(pickedFiles.files[i].path!),
        );
      }
    }
  }catch(e){
    debugPrint(e.toString());
  }
  return images;
}
