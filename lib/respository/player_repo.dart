import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/player_model.dart';

class PlayerRepo {
  static Future<List<PlayerModel>> getPlayer() async {
    Uri url = Uri.parse('https://www.balldontlie.io/api/v1/teams');
    http.Response response = await http.get(url);
    List<PlayerModel> playerModels = [];
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List data = json['data'];
        for (var element in data) {
          playerModels.add(PlayerModel.fromJson(element));
        }
      }
    } catch (e) {
      print('failed to get data');
    }
    return playerModels;
  }
}
