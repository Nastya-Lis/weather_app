import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_cast/view/current_weather/bloc/current_weather_screen_bloc.dart';
import 'package:weather_cast/view/weather_period/weather_period_screen.dart';

import '../../model/converter/date_converter.dart';
import '../../model/converter/precipitation_converter.dart';
import '../weather_period/bloc/weather_period_screen_bloc.dart';
import '../widget/dialog/dialog_app.dart';
import '../widget/widget_condition_params/drop_down_button/bloc/drop_down_button_bloc.dart';
import '../widget/widget_condition_params/drop_down_button/drop_down_button.dart';
import '../widget/widget_condition_params/widget_condition_param.dart';

class CurrentWeatherScreen extends StatelessWidget {
  const CurrentWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CurrentWeatherScreenBloc, CurrentWeatherScreenState>(
        listener: (context, state) {
          closeAllInProgressDialogs();
          if (state.status == StatusCurrentWeather.init) {
            context
                .read<DropDownButtonBloc>()
                .add(InitDropDownButtonEvent(state.weather?.location?.name));
            context
                .read<WeatherPeriodScreenBloc>()
                .add(InitWeatherPeriodEvent());
          }
          if (state.status == StatusCurrentWeather.loading) {
            showInProgressDialog(context, "Loading...");
          }
          if (state.status == StatusCurrentWeather.error) {
            showDialog(
                context: context,
                builder: (contextDialog) {
                  return AlertDialog(
                    backgroundColor: Colors.indigo,
                    title: const Text(
                      "Warning",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    content: Text(
                      state.errorMessage ?? "",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(contextDialog).pop();
                          /*context
                              .read<DropDownButtonBloc>()
                              .add(InitDropDownButtonEvent("Minsk"));*/
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.timeOfDayEnum?.color,
            body: RefreshIndicator(
              onRefresh: () async {
                Future.delayed(const Duration(seconds: 2));
                context
                    .read<CurrentWeatherScreenBloc>()
                    .add(UpdateCurrentWeatherScreenEvent());
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButtonWidget(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.33,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 40),
                        child: Image.asset(
                          precipitationToAssetImage(
                              state.weather?.current?.condition?.text),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Today, ${dateConverter(state.weather?.current?.lastUpdated)}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                shadows: [
                                  Shadow(
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 1.0,
                                    color: Color.fromARGB(255, 108, 102, 102),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                "Feels like ${state.weather?.current?.feelslikeC}°",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 3.0,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${state.weather?.current?.tempC}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.18,
                                    shadows: const [
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 5.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "°",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.1,
                                    shadows: const [
                                      Shadow(
                                        offset: Offset(2.0, 2.0),
                                        blurRadius: 5.0,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "${state.weather?.current?.condition?.text}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 5.0,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              height: 200,
                              child: Scrollbar(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.weather?.current
                                      ?.toConditionParams()
                                      .length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: WidgetConditionParam(
                                        conditionParam: state.weather?.current
                                            ?.toConditionParams()[index],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 18,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                        child: const WeatherPeriodScreen(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
