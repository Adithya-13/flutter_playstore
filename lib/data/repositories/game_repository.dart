import 'package:flutter_playstore/data/data_providers/data_providers.dart';
import 'package:flutter_playstore/data/entities/entities.dart';

class GameRepository {
  Future<EditorChoiceEntity> getEditorChoiceList() async {
    EditorChoiceEntity editorChoiceEntity = DummyGame.getEditorChoiceList();
    return editorChoiceEntity;
  }

  Future<TopFreeEntity> getTopFreeList() async {
    TopFreeEntity topFreeEntity = DummyGame.getTopFreeList();
    return topFreeEntity;
  }
}
