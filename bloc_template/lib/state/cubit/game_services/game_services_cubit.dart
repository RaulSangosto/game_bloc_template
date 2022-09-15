import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../games_services/games_services.dart';

part 'game_services_state.dart';

class GameServicesCubit extends Cubit<GameServicesState> {
  final GamesServicesController? controller;
  GameServicesCubit(this.controller)
      : super(GameServices(controller: controller));
}
