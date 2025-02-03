import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drop_down_button_event.dart';

part 'drop_down_button_state.dart';

class DropDownButtonBloc
    extends Bloc<DropDownButtonEvent, DropDownButtonState> {
  //final GeoLocatorService _geoLocatorService = GetIt.I.get<GeoLocatorService>();

  DropDownButtonBloc() : super(DropDownButtonState(name: '')) {
    on<InitDropDownButtonEvent>(_initDropDownButton);
    on<SwitchLocationDropDownButtonEvent>(_switchLocationDropDownButton);
  }

  FutureOr<void> _initDropDownButton(
      InitDropDownButtonEvent event, Emitter<DropDownButtonState> emit) async {
    emit(state.copyWith(
      name: event.nameLocalePosition,
      status: StatusDropDownButton.init,
    ));
  }

  FutureOr<void> _switchLocationDropDownButton(
      SwitchLocationDropDownButtonEvent event,
      Emitter<DropDownButtonState> emit) async {
    emit(state.copyWith(
      name: event.newLocalePosition,
      status: StatusDropDownButton.successSwitch,
    ));
  }
}
