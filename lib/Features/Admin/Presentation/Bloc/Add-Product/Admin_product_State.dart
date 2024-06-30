import 'package:equatable/equatable.dart';

abstract class AdminProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AdminProductLoadingState extends AdminProductState {}

class AdminProductLoadedState extends AdminProductState {}

class AdminProductErrorState extends AdminProductState {
  final String errorMessage;

  AdminProductErrorState({required this.errorMessage});

  @override
  List<Object?> get props => [
        errorMessage,
      ];
}
