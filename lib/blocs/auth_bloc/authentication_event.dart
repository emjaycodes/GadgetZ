part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
  
}

class SignInUser extends AuthenticationEvent {
  final String email;
  final String password;

  const SignInUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignUpUser extends AuthenticationEvent {
  final String email;
  final String password;

  const SignUpUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class SignOutUser extends AuthenticationEvent {}
