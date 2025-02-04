import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_cast/repository/shared_preference_repository.dart';

part 'drop_down_button_event.dart';

part 'drop_down_button_state.dart';

class DropDownButtonBloc
    extends Bloc<DropDownButtonEvent, DropDownButtonState> {
  final SharedPreferenceRepository _sharedPreferenceRepository;

  DropDownButtonBloc(
      {required SharedPreferenceRepository sharedPreferenceRepository})
      : _sharedPreferenceRepository = sharedPreferenceRepository,
        super(DropDownButtonState(name: '')) {
    on<InitDropDownButtonEvent>(_initDropDownButton);
    on<SwitchLocationDropDownButtonEvent>(_switchLocationDropDownButton);
    on<CurrentLocationDropDownButtonEvent>(_currentLocationDropDownButtonEvent);
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

  FutureOr<void> _currentLocationDropDownButtonEvent(
      CurrentLocationDropDownButtonEvent event,
      Emitter<DropDownButtonState> emit) {
    emit(state.copyWith(
      name: _sharedPreferenceRepository.getLocationName(),
      status: StatusDropDownButton.successCurrent,
    ));
  }
}
