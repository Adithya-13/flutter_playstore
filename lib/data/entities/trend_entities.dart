abstract class TrendBaseEntity {}

class TrendEntity extends TrendBaseEntity {
  List<TrendItemEntity> trendList;

  TrendEntity({required this.trendList});
}

class TrendItemEntity extends TrendBaseEntity {
  String preview;
  String icon;
  String name;
  String size;
  double rate;

  TrendItemEntity(
      {required this.preview,
      required this.name,
      required this.icon,
      required this.size,
      required this.rate});
}
