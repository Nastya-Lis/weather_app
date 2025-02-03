import 'package:collection/collection.dart';
import 'package:weather_cast/model/precipitation.dart';

String defaultAssetsImagePath = "assets/images/weather_condition/";
String defaultAssetsIconPath = "assets/icons/conditions/";

String precipitationToAssetImage(String? precip) {
  var result = EasyPrecipitation.values
      .firstWhereOrNull((value) => value.conditions.contains(precip));
  return result != null
      ? "$defaultAssetsImagePath${result.name}.png"
      : "${defaultAssetsImagePath}cloud.png";
}

String precipitationToAssetIcon(String? precip) {
  return precip != null
      ? "$defaultAssetsIconPath$precip"
      : "${defaultAssetsIconPath}precip.png";
}
