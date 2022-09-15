part of 'game_services_cubit.dart';

@immutable
abstract class GameServicesState {
  final GamesServicesController? controller;

  const GameServicesState({required this.controller});
}

class GameServices extends GameServicesState {
  const GameServices({required super.controller});
}
