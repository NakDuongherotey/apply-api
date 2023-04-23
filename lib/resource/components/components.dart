
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/player_model.dart';
import '../../viewmodel/home_viewmodel.dart';

class PlayerItem extends StatefulWidget {
  final PlayerModel player;

  const PlayerItem({
    super.key,
    required this.player,
  });

  @override
  State<PlayerItem> createState() => _PlayerItemState();
}

class _PlayerItemState extends State<PlayerItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.player.name ?? '-',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Real name: ${widget.player.fullName}',
                      style: const TextStyle(fontSize: 13),
                    ),
                    Text(
                      'City: ${widget.player.city}',
                      style: const TextStyle(fontSize: 13),
                    ),
                    Text(
                      'Team: ${widget.player.abbreviation}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Consumer<HomeViewModel>(
          builder: (context, consumer, child) {
            var icon = Icons.favorite_outline_rounded;
            for (int id in consumer.favoritedPlayers) {
              if (id == widget.player.id) {
                icon = Icons.favorite;
              }
            }
            return Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: () {
                  consumer.toggleFavoritedPlayer(widget.player.id!);
                },
                icon: Icon(
                  icon,
                  color: Colors.red,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}