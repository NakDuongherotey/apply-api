import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resource/components/components.dart';
import '../../viewmodel/home_viewmodel.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    var provider = Provider.of<HomeViewModel>(context, listen: false);
    provider.fetchPlayerModels();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Consumer<HomeViewModel>(
          builder: (context, consumer, child) {
            if (consumer.playerModels.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                for (var player in consumer.playerModels)
                  PlayerItem(player: player),
              ],
            );
          },
        ),
      ),
    );
  }
}

