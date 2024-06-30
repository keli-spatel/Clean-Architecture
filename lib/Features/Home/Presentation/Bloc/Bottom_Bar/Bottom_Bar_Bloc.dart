import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Bloc/Bottom_Bar/Bottom_Bar_Event.dart';

import 'Bottom_Bar_State.dart';

class BottomBarBloc extends Bloc<BottomBarEvent,BottomBarState>{
  BottomBarBloc(): super(BottomBarState()){
    on<TriggerBottomBarIconEvent>((event,emit){
      emit(BottomBarState(index: event.index));
    });
  }
}