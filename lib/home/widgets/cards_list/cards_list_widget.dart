import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/widgets/card/card_widget.dart';
import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: GridView.count(
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          crossAxisCount: 2,
          children: [
            CardWidget(
                title: 'Gerenciamento de Estado',
                icon: AppImages.data,
                completed: 3,
                total: 10),
            CardWidget(
                title: 'Construindo Interfaces',
                icon: AppImages.laptop,
                completed: 10,
                total: 10),
            CardWidget(
                title: 'Integração Nativa',
                icon: AppImages.hierarchy,
                completed: 9,
                total: 10),
            CardWidget(
                title: 'Widgets do Flutter',
                icon: AppImages.blocks,
                completed: 5,
                total: 10),
          ],
        ),
      ),
    );
  }
}
