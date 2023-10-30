import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'switch_theme_event.dart';
part 'switch_theme_state.dart';

class SwitchThemeBloc extends Bloc<SwitchThemeEvent, SwitchThemeState> {
  SwitchThemeBloc() : super(const SwitchThemeInitial(switchValue: false)) {
    on<SwitchOnEvent>(_onSwitchOnEvent);
    on<SwitchOffEvent>(_onSwitchOffEvent);
  }

  FutureOr<void> _onSwitchOnEvent(
    SwitchOnEvent event,
    Emitter<SwitchThemeState> emit,
  ) {
    emit(const SwitchThemeInitial(switchValue: true));
  }

  FutureOr<void> _onSwitchOffEvent(
    SwitchOffEvent event,
    Emitter<SwitchThemeState> emit,
  ) {
    emit(const SwitchThemeInitial(switchValue: false));
  }
}
