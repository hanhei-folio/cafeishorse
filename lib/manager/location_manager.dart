import 'package:fetching_data/constant/constants.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationManager {
  static Future<bool> askLocationPermission() async {
    await Permission.location.request();
    var status = await Permission.location.status;
    if (status.isDenied) {
      await Permission.location.request();
    }
    return (await Permission.location.status).isGranted;
  }

  // 위치정보 수집이 승인된 이후에 호출되어야 합니다.
  static Future<LocationData> getCurrentLocation() async {
    return await Location().getLocation();
  }

  // 동의했다면 현위치, 미동의라면 신촌역
  static Future<String> getCurrentLatitude() async {
    bool result = await LocationManager.askLocationPermission();
    String x = sinchonStationX;

    if (result) {
      var locationData = await LocationManager.getCurrentLocation();
      if (locationData.latitude != null) x = locationData.latitude.toString();
    }
    return x;
  }

  static Future<String> getCurrentLongitude() async {
    bool result = await LocationManager.askLocationPermission();
    String y = sinchonStationY;

    if (result) {
      var locationData = await LocationManager.getCurrentLocation();
      if (locationData.latitude != null) y = locationData.longitude.toString();
    }
    return y;
  }
}