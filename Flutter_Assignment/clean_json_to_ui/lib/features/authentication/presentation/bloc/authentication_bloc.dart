import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_json_to_ui/core/util/utility.dart';
import 'package:meta/meta.dart';

import '../../data/model/authentication_model.dart';
import '../../data/repositories/authentication_repository_impl.dart';
import '../../domain/usecases/authentication_login.dart';
import '../../domain/usecases/authentication_register.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late AuthenticationLogin authenticationLogin;
  late AuthenticationRegister authenticationRegister;
  AuthenticationBloc(
      {required this.authenticationLogin, required this.authenticationRegister})
      : super(AuthenticationInitial()) {
    on<AuthenticationSignupEvent>(
        (event, emit) => emit(AuthenticationSignupState()));

    on<AuthenticationSigninToSignupEvent>(
        (event, emit) => emit(AuthenticationSigninToSignupState()));

    on<AuthenticationSigninEvent>(
        (event, emit) => emit(AuthenticationSigninState()));
  }
  loadSigninScreen() {
    add(AuthenticationSigninEvent());
  }

  loadSignupScreen() {
    add(AuthenticationSignupEvent());
  }

  loadSigninToSignupScreen() {
    add(AuthenticationSigninToSignupEvent());
  }

  dynamic callAuthenticationSignIn() async {
    await authenticationLogin();
    return decision;
  }

  dynamic callAuthenticationSignUp() async {
    await authenticationRegister();
    return login_credentails;
  }
}

// class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
//   late HomeScreenOfflineData homeScreenOfflineData;
//   late HomeScreenOnlineData homeScreenOnlineData;
//   HomeScreenBloc(
//       {required this.homeScreenOnlineData, required this.homeScreenOfflineData})
//       : super(HomeScreenInitial()) {
//     on<HomeScreenEvent>((event, emit) => (HomeScreenInitial()));
//   }
//   Future<List<GuideLinesModal>> callDecider() async {
//     if (switchValue == false) {
//       await homeScreenOfflineData();
//     }
//
//     if (switchValue == true) {
//       await homeScreenOnlineData();
//     }
//     return listGuideLineModal;
//   }
// }
