import 'package:fetching_data/constant/constants.dart';
import 'package:fetching_data/model/cafe_model.dart';
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationManager {
  static String x = sinchonStationX, y = sinchonStationY;

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
      if (locationData.longitude != null) x = locationData.longitude.toString();
    }

    LocationManager.x = x;

    return x;
  }

  static Future<String> getCurrentLongitude() async {
    bool result = await LocationManager.askLocationPermission();
    String y = sinchonStationY;

    if (result) {
      var locationData = await LocationManager.getCurrentLocation();
      if (locationData.latitude != null) y = locationData.latitude.toString();
    }

    LocationManager.y = y;

    return y;
  }

  // 반환 단위 미터(m)
  static int getDistance(CafeModel cafe) {
    try {
      LatLng userLatLng = LatLng(double.parse(x), double.parse(y));
      LatLng cafeLatLng = LatLng(double.parse(cafe.x!), double.parse(cafe.y!));
      return SphericalUtil.computeDistanceBetween(userLatLng, cafeLatLng)
          .toInt();
    } catch (e, s) {
      return 1000; // 카페 x, y 정보가 없을 시 1000m 취급을 합니다.
    }
  }
}
