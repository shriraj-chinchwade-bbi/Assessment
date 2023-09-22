import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_dummy_event.dart';
part 'bloc_dummy_state.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {
  DummyBloc() : super(DummyInitial()) {
    on<DummyEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SplashScreenEvent>((event, emit) {
      emit(SplashScreenState());
    });
    on<SignInEvent>((event, emit) {
      emit(SignInState());
    });
    on<HomeScreenEvent>((event, emit) {
      emit(HomeScreenState());
    });
    on<ProfilePageEvent>((event, emit) {
      emit(ProfilePageState());
    });
  }

  loadSplashScreen() {
    add(SplashScreenEvent());
  }

  loadSign() {
    add(SignInEvent());
  }

  loadHomeScreen() {
    add(HomeScreenEvent());
  }

  loadProfilePage() {
    add(ProfilePageEvent());
  }
}
