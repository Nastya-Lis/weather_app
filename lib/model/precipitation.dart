enum EasyPrecipitation {
  cloud([
    "Cloudy",
    "Partly Cloudy",
  ]),
  sun(["Sunny"]),
  sunSnow([]),
  sunCloud([]),
  cloudRainSun([]),
  nightCloud([]),
  rain([
    "Patchy Rain",
    "Patchy light rain",
    "Light rain",
    "Moderate rain",
    "Heavy rain",
    "Light freezing rain",
    "Moderate or heavy freezing rain",
    "Moderate or heavy rain shower",
    "Light rain shower",
    "Torrential rain shower",
    "Patchy light rain in area with thunder", // дождь с грозой
    "Moderate or heavy rain in area with thunder",
  ]),
  snow([
    "Patchy snow nearby",
    "Blowing snow",
    "Patchy light snow",
    "Light snow",
    "Patchy moderate snow",
    "Moderate snow",
    "Patchy heavy snow",
    "Heavy snow",
    "Light snow showers", //дождь со снегом
    "Moderate or heavy snow showers",
    "Patchy light snow in area with thunder", //снег с грозой
    "Moderate or heavy snow in area with thunder"
  ]),
  storm([
    "Thundery outbreaks in nearby",
  ]),
  clear(["Clear"]),
  overcast(["Overcast"]),
  blizzard(["Blizzard"]),
  fog(["Fog", "Freezing fog", "Mist"]),
  ice([
    "Ice pellets",
    "Light showers of ice pellets",
    "Moderate or heavy showers of ice pellets",
  ]), // ice pellets
  sleet([
    "Patchy sleet nearby",
    "Light sleet",
    "Moderate or heavy sleet",
    "Light sleet showers",
    "Moderate or heavy sleet showers",
  ]),
  drizzle([
    "Patchy freezing drizzle nearby",
    "Patchy light drizzle",
    "Light drizzle",
    "Freezing drizzle",
  ]);

  final List<String> conditions;

  const EasyPrecipitation(this.conditions);
}
