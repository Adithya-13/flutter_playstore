abstract class GameBaseEntity {}

class EditorChoiceEntity extends GameBaseEntity {
  final List<EditorChoiceItemEntity> editorChoiceList;

  EditorChoiceEntity({required this.editorChoiceList});
}

class EditorChoiceItemEntity extends GameBaseEntity {
  final String preview;
  final String icon;
  final String name;

  EditorChoiceItemEntity(
      {required this.preview, required this.icon, required this.name});
}

class TopFreeEntity extends GameBaseEntity {
  final List<TopFreeItemEntity> topFreeList;

  TopFreeEntity({required this.topFreeList});
}

class TopFreeItemEntity extends GameBaseEntity {
  final String icon;
  final String name;
  final String size;
  final double rate;

  TopFreeItemEntity(
      {required this.icon,
      required this.name,
      required this.size,
      required this.rate});
}
