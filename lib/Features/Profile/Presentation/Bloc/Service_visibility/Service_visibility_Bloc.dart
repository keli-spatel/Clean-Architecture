import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Bloc/Service_visibility/Service_visibility_Event.dart';

import 'Service_visibilityz_State.dart';

class ServiceVisibilityBloc
    extends Bloc<ServiceVisibilityEvent, ServiceVisibilityState> {
  ServiceVisibilityBloc() : super(ServiceVisibilityState(isVisible: false)) {
    on<TriggerListVisibility>((event, emit) {
      emit(ServiceVisibilityState(isVisible: !state.isVisible));
    });
  }
}
