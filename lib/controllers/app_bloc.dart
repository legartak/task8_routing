import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_routing/controllers/app_event.dart';
import 'package:task8_routing/controllers/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AddCoinEvent>(_onAddCoin);
    on<BuyCatEvent>(_onBuyCat);
    on<BuyDogEvent>(_onBuyDog);
    on<PlaceBidEvent>(_onPlaceBid);
    on<GetWinningsEvent>(_onGetWinnings);
  }

  void _onAddCoin(AppEvent event, Emitter<AppState> emit) {
    emit(AppData(
        coins: state.coins + state.income,
        dogs: state.dogs,
        cats: state.cats,
        income: state.income));
  }

  void _onBuyCat(AppEvent event, Emitter<AppState> emit) {
    emit(AppData(
        coins: state.coins - 5,
        dogs: state.dogs,
        cats: state.cats + 1,
        income: state.income + 1));
  }

  void _onBuyDog(AppEvent event, Emitter<AppState> emit) {
    emit(AppData(
        coins: state.coins - 10,
        dogs: state.dogs + 1,
        cats: state.cats,
        income: state.income + 3));
  }

  void _onPlaceBid(PlaceBidEvent event, Emitter<AppState> emit) {
    emit(AppData(
        coins: state.coins - event.bid,
        dogs: state.dogs,
        cats: state.cats,
        income: state.income));
  }

  void _onGetWinnings(GetWinningsEvent event, Emitter<AppState> emit) {
    emit(AppData(
        coins: state.coins + event.winnings,
        dogs: state.dogs,
        cats: state.cats,
        income: state.income));
  }
}
