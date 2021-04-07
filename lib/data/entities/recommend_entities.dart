abstract class RecommendBaseEntity {}

class RecommendEntity extends RecommendBaseEntity {
  List<RecommendItemEntity> recommendList;

  RecommendEntity({required this.recommendList});
}

class RecommendItemEntity extends RecommendBaseEntity {
  String icon;
  String name;
  double rate;

  RecommendItemEntity(
      {required this.name, required this.icon, required this.rate});
}
