part of 'switch_theme_bloc.dart';

class SwitchThemeState extends Equatable {
  final bool switchValue;
  const SwitchThemeState({required this.switchValue});

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "switchValue": switchValue,
    };
  }

  factory SwitchThemeState.fromMap(Map<String, dynamic> map) {
    return SwitchThemeState(
      switchValue: map["switchValue"],
    );
  }
}

final class SwitchThemeInitial extends SwitchThemeState {
  const SwitchThemeInitial({required super.switchValue});
}
