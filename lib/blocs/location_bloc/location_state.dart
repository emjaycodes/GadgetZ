part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  
  @override
  List<Object> get props => [];
}
// LocationState represents the different states of the location process

class LocationInitialState extends LocationState {}

class LocationLoadingState extends LocationState {}

class LocationLoadedState extends LocationState {
  final String address;

  const LocationLoadedState(this.address);
}
class LocationErrorState extends LocationState {
  final String message;

  LocationErrorState(this.message);
}
