import 'package:geolocator/geolocator.dart';
class Location{
  double latitude=0.0;
  double longitude=0.0;
  Future<void>getCurrentLocation()async{
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        print('Location denied');
        LocationPermission ask = await Geolocator.requestPermission();
      }
      else {
        Position currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude=currentPosition.latitude;
        longitude=currentPosition.longitude;
      }
    }
    catch(e){
      print(e);
    }

  }

}

// double temperature=decodedDate['main']['temp'];
// int condition=decodedDate['weather'][0]['id'];
// String cityName=decodedDate['name'];