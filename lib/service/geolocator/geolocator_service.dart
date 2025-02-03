import 'package:geolocator/geolocator.dart';

class GeoLocatorService {
  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Future<bool> isEnabledLocationService() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<Position> getPosition() async {
    return await Geolocator.getCurrentPosition(
        locationSettings: locationSettings);
  }

  checkPermission() async {
    if (!await isEnabledLocationService()) {
      Geolocator.requestPermission();
    }
  }
}
