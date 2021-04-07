import 'package:flutter_playstore/data/data_providers/data_providers.dart';
import 'package:flutter_playstore/data/entities/entities.dart';

class TrendRepository {
  Future<TrendEntity> getTrendList() async {
    TrendEntity trendEntity = DummyData.getTrendList();
    return trendEntity;
  }
}
