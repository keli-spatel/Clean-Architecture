class BottomBarEvent {}

class TriggerBottomBarIconEvent extends BottomBarEvent {
  final int index;

  TriggerBottomBarIconEvent({required this.index});
}
