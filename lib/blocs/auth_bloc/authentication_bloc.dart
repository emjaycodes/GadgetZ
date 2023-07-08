import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oga_bassey/services/auth_services.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

final AuthService authService = AuthService();

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SignInUser>((event, emit) {
      emit(AuthenticationLoadingState());
      try {
        authService.signInUser(
          event.email,
          event.password,
        );
      } catch (e) {
        emit(AuthenticationFailureState(e.toString()));
      }
    });
    on<SignUpUser>((event, emit) {
      emit(AuthenticationLoadingState());
      try {
        authService.signUpUser(event.email, event.password);
      } catch (e) {
        emit(AuthenticationFailureState(e.toString()));
      }
    });
    on<SignOutUser>((event, emit) {
      emit(AuthenticationLoadingState());
      try {
        authService.signOutUser();
      } catch (e) {
        emit(AuthenticationFailureState(e.toString()));
      }
    });
  }
}
