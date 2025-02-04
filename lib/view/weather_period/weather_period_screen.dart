import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_cast/router/router.dart';
import 'package:weather_cast/view/weather_period/bloc/weather_period_screen_bloc.dart';

import '../../model/converter/date_converter.dart';

class WeatherPeriodScreen extends StatelessWidget {
  const WeatherPeriodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherPeriodScreenBloc, WeatherPeriodScreenState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              const Text(
                "Forecast 7 days",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.forecast?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.push(
                            AppRoutes.infoWeatherScreen.path,
                            extra: state.forecast?[index],
                          );
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.1,
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: Image.network(
                                  "https:${state.forecast?[index].hour?.first.condition.icon}",
                                  errorBuilder: (context, error, trace) {
                                    return const Icon(Icons.no_photography);
                                  },
                                ),
                              ),
                              Text(
                                dateConverter(state.forecast?[index].date),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${state.forecast?[index].hour?.first.tempC}°",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
