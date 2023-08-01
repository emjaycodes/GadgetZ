
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService{
   Position? currentPosition; 

   Future<Position> getPosition ()async{
    
      bool serviceEnabled;
      LocationPermission permission;
     
     serviceEnabled = await Geolocator.isLocationServiceEnabled();
      permission = await Geolocator.checkPermission();


    if (!serviceEnabled){
      throw Exception("Location services are not enabled." );
    }
    
    
    if (permission == LocationPermission.denied) {
      Geolocator.requestPermission();
        
        throw Exception("Location services are not enabled.");
        
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception("Location permission denied forever.");
    }

    if (permission == LocationPermission.whileInUse) {
      print(Geolocator.getCurrentPosition());
    }

     if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 
    
       return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    
  }

  // get getPosition => _getPosition();
  
  //  _getAddressFromCoordinates() async{
    
  //   try {
  //     List<Placemark> placesmarks = await placemarkFromCoordinates(currentPosition!.latitude, currentPosition!.latitude);
  //   } catch (e) {
      
  //   }
  // }
}