import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resource/components/components.dart';
import '../../viewmodel/home_viewmodel.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Consumer<HomeViewModel>(
          builder: (context, consumer, child) {
            if (consumer.favoritedPlayers.isEmpty) {
              // return const Center(child: CircularProgressIndicator());
              return Text('No data');
            }
            return Column(
              children: [
                for (int id in consumer.favoritedPlayers)
                  for (var player in consumer.playerModels)
                    if (player.id == id) PlayerItem(player: player)
              ],
            );
          },
        ),
      ),
    );
  }
}
