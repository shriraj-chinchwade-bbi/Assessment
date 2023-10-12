part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class AuthenticationSignupEvent extends AuthenticationEvent {}

class AuthenticationSigninEvent extends AuthenticationEvent {}

class AuthenticationSigninToSignupEvent extends AuthenticationEvent {}

// class SignupPageInputEvent extends AuthenticationDataEvent {
//    SignupPageInputEvent({required this.name, required this.email, required this.password});
//
//   final String name; final String email; final String password;
// }
