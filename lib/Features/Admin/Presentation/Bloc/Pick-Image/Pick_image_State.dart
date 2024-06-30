import 'dart:io';

abstract class ImagePickerState {}

class ImagePickerLoadingState extends ImagePickerState {}

class ImagePickerLoadedState extends ImagePickerState {
  final List<File> images;

  ImagePickerLoadedState({required this.images});
}
