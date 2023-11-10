import 'package:flutter/foundation.dart';
import 'package:golf/course/hole.dart';
import 'package:golf/player/player.dart';

class MyAppState extends ChangeNotifier {
  List<Player> players = [];
  List<Hole> holes = List<Hole>.filled(18, Hole());

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

  void setParForHole(int holeIndex, int par) {
    holes[holeIndex].par = par;
    notifyListeners();
  }

  void setMensHandicapForHole(int hole, int handicap) {
    holes[hole + 1].mensHandicap = handicap;
    notifyListeners();
  }

  void setWomensHandicapForHole(int hole, int handicap) {
    holes[hole + 1].womensHandicap = handicap;
    notifyListeners();
  }
}
