import 'package:flutter/material.dart';
import 'package:flutter_playstore/presentation/pages/game/widgets/widgets.dart';
import 'package:flutter_playstore/presentation/widgets/widgets.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchField(),
            EditorChoiceSection(),
            TopFreeSection(),
          ],
        ),
      ),
    );
  }
}
