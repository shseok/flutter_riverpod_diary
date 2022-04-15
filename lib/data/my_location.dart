import 'package:geolocator/geolocator.dart';

class MyLocation{
  double latitude2 = 37.5657033;
  double logitude2 = 126.97686;

  Future<void> getLocation() async{
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      logitude2 = position.longitude;
      print(latitude2);
      print(logitude2);
    }catch (e) {
      // TODO
      print('There was a problem with the internet connection');
      print('$latitude2 with error');
      print('$logitude2 with error');
    }
  }
}