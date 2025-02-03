part of 'drop_down_button_bloc.dart';

sealed class DropDownButtonEvent {}

class InitDropDownButtonEvent extends DropDownButtonEvent {
  final String? nameLocalePosition;

  InitDropDownButtonEvent(this.nameLocalePosition);
}

class SwitchLocationDropDownButtonEvent extends DropDownButtonEvent {
  final String? newLocalePosition;

  SwitchLocationDropDownButtonEvent(this.newLocalePosition);
}
