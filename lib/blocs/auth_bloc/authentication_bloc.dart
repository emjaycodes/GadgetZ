import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:oga_bassey/models/user_model.dart';
import 'package:oga_bassey/services/auth_services.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

final AuthService authService = AuthService();

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitialState()) {
    on<AuthenticationEvent>((event, emit) {});

    on<SignInUser>((event, emit) async {
      emit(AuthenticationLoadingState());
      final UserModel? user =
          await authService.signInUser(event.email, event.password);
      if (user != null) {
        emit(AuthenticationSuccessState(user));
      } else {
        emit(const AuthenticationFailureState('sign in failed'));
      }
    });

    on<SignUpUser>((event, emit) async {
      emit(AuthenticationLoadingState());
      final UserModel? user =
          await authService.signUpUser(event.email, event.password);
      if (user != null) {
        emit(AuthenticationSuccessState(user));
      } else {
        emit(const AuthenticationFailureState('sign up failed')); 
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
