import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {

    double? latitude;
    double? longitude;
   Position? currentPosition;
   Placemark? address;
   String? stateAddress;
   String? countryAddress;


  Future<void> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();

    if (!serviceEnabled) {
       Geolocator.openLocationSettings();
    }

    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();

      throw Exception("Location services are not enabled.");
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission denied forever.");
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    try {
        currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

          latitude = currentPosition?.latitude ?? 0.0;
          longitude = currentPosition?.longitude ?? 0.0;
      print('pos $latitude $longitude $currentPosition' );
  
    } catch (e) {
      print(e);
    }
  }

    
   getAddressFromCoordinates() async{
    try {
      await getPosition(); 
      List<Placemark> placesmarks = await placemarkFromCoordinates(latitude!, longitude!);
       address = placesmarks[0];
       stateAddress = address!.street;
       countryAddress = address!.country;
      // print(address);
      print(stateAddress);
      print(countryAddress);
    } catch (e) {
      print(e);
    }
  }

}
