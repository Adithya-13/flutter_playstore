import 'package:flutter_playstore/data/data_providers/data_providers.dart';
import 'package:flutter_playstore/data/entities/entities.dart';

class CategoryRepository {
  Future<CategoryEntity> getCategoryList() async {
    CategoryEntity categoryEntity = DummyData.getCategoryList();
    return categoryEntity;
  }
}
