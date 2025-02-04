part of 'drop_down_button_bloc.dart';

enum StatusDropDownButton {
  init,
  successSwitch,
  successCurrent,
  error,
}

class DropDownButtonState extends Equatable {
  final String? name;
  final StatusDropDownButton status;
  final String? errorMessage;

  DropDownButtonState({
    required this.name,
    this.status = StatusDropDownButton.init,
    this.errorMessage,
  });

  DropDownButtonState copyWith({
    String? name,
    StatusDropDownButton? status,
    String? errorMessage,
  }) {
    return DropDownButtonState(
      name: name ?? this.name,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        name,
        status,
        errorMessage,
      ];
}
