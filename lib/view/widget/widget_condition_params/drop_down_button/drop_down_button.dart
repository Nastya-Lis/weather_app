import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/view/current_weather/bloc/current_weather_screen_bloc.dart';
import 'package:weather_cast/view/widget/widget_condition_params/drop_down_button/bloc/drop_down_button_bloc.dart';

class DropdownButtonWidget extends StatefulWidget {
  const DropdownButtonWidget({
    super.key,
  });

  @override
  _DropdownButtonWidgetState createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  String dropdownValue = "Minsk";

  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DropDownButtonBloc, DropDownButtonState>(
      listener: (context, state) {
        if (state.status == StatusDropDownButton.init) {
          setState(() {
            dropdownValue = state.name ?? "Not detected";
          });
        }
        if (state.status == StatusDropDownButton.successSwitch) {
          context
              .read<CurrentWeatherScreenBloc>()
              .add(SwitchLocationWeatherScreenEvent(dropdownValue));
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            IconButton(
              onPressed: () {
                context
                    .read<CurrentWeatherScreenBloc>()
                    .add(InitCurrentWeatherScreenEvent());
                /*context
                    .read<DropDownButtonBloc>()
                    .add(InitDropDownButtonEvent());*/
                showDialog(
                    context: context,
                    builder: (innerContext) => AlertDialog(
                          content: CountryStateCityPicker(
                              country: countryController,
                              state: stateController,
                              city: cityController,
                              dialogColor: Colors.grey.shade200,
                              textFieldDecoration: InputDecoration(
                                  fillColor: Colors.blueGrey.shade100,
                                  filled: true,
                                  suffixIcon:
                                      const Icon(Icons.arrow_downward_rounded),
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none))),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              dropdownValue = cityController.value.text;
                            });
                            context
                                .read<DropDownButtonBloc>()
                                .add(SwitchLocationDropDownButtonEvent(dropdownValue));
                          },
                          child: const Text(
                            "Save",
                            style:
                            TextStyle(color: Colors.indigo),
                          ),
                        ),
                      ],
                        )).then((value) => print(value));
                
                
              },
              icon: const Icon(
                Icons.gps_fixed,
                color: Colors.white,
              ),
            ),
            Text(dropdownValue),
          ],
        );
      },
    );
  }
}
