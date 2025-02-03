import 'package:flutter/material.dart';
import 'package:weather_cast/model/forecast/astro/astronomy.dart';

class WidgetAstronomyCast extends StatelessWidget {
  final Astronomy? astronomy;
  final String baseAstronomyUrl = "assets/icons/astronomy";

  const WidgetAstronomyCast({super.key, required this.astronomy});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              "Astronomy conditions",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                child: Image.asset(
                  "$baseAstronomyUrl/sunrise.png",
                  color: Colors.white,
                ),
              ),
              Text(
                "Sun Rise: ${astronomy?.sunrise}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                child: Image.asset(
                  "$baseAstronomyUrl/sunset.png",
                  color: Colors.white,
                ),
              ),
              Text(
                "Sun Set: ${astronomy?.sunset}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                child: Image.asset(
                  "$baseAstronomyUrl/moonrise.png",
                  color: Colors.white,
                ),
              ),
              Text(
                "Moon rise: ${astronomy?.moonrise}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.1,
                child: Image.asset(
                  "$baseAstronomyUrl/moonset.png",
                  color: Colors.white,
                ),
              ),
              Text(
                "Moon set: ${astronomy?.moonset}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            "Moon phase: ${astronomy?.moonPhase}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
