import 'package:flutter_playstore/data/data_providers/data_providers.dart';
import 'package:flutter_playstore/data/entities/entities.dart';

class HomeRepository {
  Future<CategoryEntity> getCategoryList() async {
    CategoryEntity categoryEntity = DummyHome.getCategoryList();
    return categoryEntity;
  }

  Future<RecommendEntity> getRecommendList() async {
    RecommendEntity recommendEntity = DummyHome.getRecommendList();
    return recommendEntity;
  }

  Future<TrendEntity> getTrendList() async {
    TrendEntity trendEntity = DummyHome.getTrendList();
    return trendEntity;
  }
}
