import 'package:flutter/material.dart';
import 'package:weather_cast/model/forecast/forecast.dart';
import 'package:weather_cast/view/widget/widget_astronomy_cast.dart';

import '../../model/converter/date_converter.dart';
import '../widget/widget_condition_params/widget_condition_param.dart';

class DetailsWeatherCastScreen extends StatelessWidget {
  final Forecast? forecast;

  const DetailsWeatherCastScreen({super.key, required this.forecast});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Scrollbar(
                      child: ListView.separated(
                        itemCount: forecast?.hour?.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Image.network(
                              "https:${forecast?.hour?[index].condition.icon}",
                              errorBuilder: (context, error, trace) {
                                return const Icon(Icons.no_photography);
                              },
                            ),
                            title: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    timeConverter(forecast?.hour?[index].time),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "${forecast?.hour?[index].condition.text}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            trailing: Text(
                              "${forecast?.hour?[index].tempC}°",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.indigo,
                                      title: const Text(
                                        "Full Forecast",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: List.generate(
                                              forecast?.hour?[index]
                                                      .toConditionParams()
                                                      .length ??
                                                  0, (indexCurrent) {
                                            return WidgetConditionParam(
                                              conditionParam: forecast
                                                      ?.hour?[index]
                                                      .toConditionParams()[
                                                  indexCurrent],
                                            );
                                          }),
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text(
                                            "Close",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const Divider();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: WidgetAstronomyCast(astronomy: forecast?.astronomy),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
