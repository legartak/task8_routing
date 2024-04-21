abstract class AppEvent {}

class AddCoinEvent extends AppEvent {}

class BuyCatEvent extends AppEvent {}

class BuyDogEvent extends AppEvent {}

class PlaceBidEvent extends AppEvent {
  final int bid;
  PlaceBidEvent(this.bid);

  List<Object> get props => [bid];
}

class GetWinningsEvent extends AppEvent {
  final int winnings;
  GetWinningsEvent(this.winnings);

  List<Object> get props => [winnings];
}
