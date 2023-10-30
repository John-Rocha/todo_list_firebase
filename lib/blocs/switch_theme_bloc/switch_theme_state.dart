part of 'switch_theme_bloc.dart';

class SwitchThemeState extends Equatable {
  final bool switchValue;
  const SwitchThemeState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];
}

final class SwitchThemeInitial extends SwitchThemeState {
  const SwitchThemeInitial({required super.switchValue});
}
