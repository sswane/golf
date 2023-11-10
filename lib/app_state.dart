import 'package:flutter/foundation.dart';
import 'package:golf/player/player.dart';

class MyAppState extends ChangeNotifier {
  List<Player> players = [];

  void addPlayer(String name, double handicap) {
    players.add(Player(name: name, handicap: handicap));
    notifyListeners();
  }

  void removePlayer(Player player) {
    players.remove(player);
    notifyListeners();
  }

  void editPlayer(Player player, String name, double handicap) {
    player.name = name;
    player.handicap = handicap;
    notifyListeners();
  }
}
