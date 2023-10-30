part of 'switch_theme_bloc.dart';

sealed class SwitchThemeEvent extends Equatable {
  const SwitchThemeEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwitchThemeEvent {
  const SwitchOnEvent();
}

class SwitchOffEvent extends SwitchThemeEvent {
  const SwitchOffEvent();
}
