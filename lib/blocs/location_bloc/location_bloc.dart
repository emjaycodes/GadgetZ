import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oga_bassey/services/location_service.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
   final LocationService _locationService = LocationService();
  LocationBloc() : super(LocationInitialState()) {
    on<LocationEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchLocationEvent>((event, emit) async {
      emit(LocationLoadingState());
      try {
        await _locationService.getAddressFromCoordinates();
         String address =
            '${_locationService.stateAddress}, ${_locationService.countryAddress}';
            emit(LocationLoadedState(address));
      } catch (e) {
        emit(LocationErrorState('failed to fecth location'));
      }
    });
  }
  
}
