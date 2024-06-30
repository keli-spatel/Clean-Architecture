import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Pick-Image/Pick_image_Event.dart';
import 'package:e_commerce_app/Features/Admin/Presentation/Bloc/Pick-Image/Pick_image_State.dart';

import '../../../../../Core/Common/Pick_image/pick_image.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  ImagePickerBloc() : super(ImagePickerLoadedState(images: [])) {
    on<PickImageEvent>((event, emit) async {
      emit(ImagePickerLoadingState());
      List<File> pickedFile = await pickImages();
      emit(ImagePickerLoadedState(images: pickedFile));
    });

    on<ClearImagesEvent>((event, emit) {
      emit(ImagePickerLoadedState(images: []));
    });
  }

  // @override
  // Future<void> close() async {
  //   await super.close();
  //   emit(ImagePickerLoadedState(images: [])); // Clear images on bloc disposal
  // }
}

// Future<List<File>> _pickImages(){
//
// }
