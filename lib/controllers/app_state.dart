abstract class AppState {
  final int coins;
  final int dogs;
  final int cats;
  final int income;

  AppState(
      {required this.coins,
      required this.dogs,
      required this.cats,
      required this.income});
}

class AppInitial extends AppState {
  AppInitial() : super(coins: 0, dogs: 0, cats: 0, income: 1);
}

class AppData extends AppState {
  AppData(
      {required super.coins,
      required super.dogs,
      required super.cats,
      required super.income});
}
