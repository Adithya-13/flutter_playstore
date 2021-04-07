import 'package:flutter_playstore/data/data_providers/data_providers.dart';
import 'package:flutter_playstore/data/entities/entities.dart';

class RecommendRepository {
  Future<RecommendEntity> getRecommendList() async {
    RecommendEntity recommendEntity = DummyData.getRecommendList();
    return recommendEntity;
  }
}
