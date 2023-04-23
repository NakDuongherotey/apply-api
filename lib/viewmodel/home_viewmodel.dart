import 'package:flutter/material.dart';

import '../model/player_model.dart';
import '../respository/player_repo.dart';

class HomeViewModel extends ChangeNotifier {
  List<PlayerModel> playerModels = [];
  List<int> favoritedPlayers = [];

  fetchPlayerModels() async {
    playerModels = await PlayerRepo.getPlayer();
    notifyListeners();
  }

  toggleFavoritedPlayer(int id) {
    if (favoritedPlayers.contains(id)) {
      favoritedPlayers.remove(id);
    } else {
      favoritedPlayers.add(id);
    }
    notifyListeners();
  }

}
