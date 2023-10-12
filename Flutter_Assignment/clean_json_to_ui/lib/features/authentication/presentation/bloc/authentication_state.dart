part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSignupState extends AuthenticationState {}

class AuthenticationSigninState extends AuthenticationState {}

class AuthenticationSigninToSignupState extends AuthenticationState {}
