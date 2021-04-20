import 'package:devquiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:devquiz/home/widgets/cards_list/cards_list_widget.dart';
import 'package:devquiz/home/widgets/tags_list/tags_list_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Column(
          children: [TagsListWidget(), CardListWidget()],
        ),
      ),
    );
  }
}
