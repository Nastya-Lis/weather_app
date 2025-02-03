part of 'drop_down_button_bloc.dart';

enum StatusDropDownButton {
  init,
  successSwitch,
  error,
}

class DropDownButtonState extends Equatable {
  final String? name;
  final StatusDropDownButton status;

  DropDownButtonState({
    required this.name,
    this.status = StatusDropDownButton.init,
  });

  DropDownButtonState copyWith({
    String? name,
    StatusDropDownButton? status,
  }) {
    return DropDownButtonState(
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        name,
        status,
      ];
}
