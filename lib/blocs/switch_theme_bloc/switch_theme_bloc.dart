import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'switch_theme_event.dart';
part 'switch_theme_state.dart';

class SwitchThemeBloc extends HydratedBloc<SwitchThemeEvent, SwitchThemeState> {
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

  @override
  SwitchThemeState? fromJson(Map<String, dynamic> json) =>
      SwitchThemeState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(SwitchThemeState state) => state.toMap();
}
