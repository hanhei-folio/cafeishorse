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
}