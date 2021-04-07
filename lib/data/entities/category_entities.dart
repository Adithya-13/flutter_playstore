import 'package:flutter/material.dart';

abstract class CategoryBaseEntity {}

class CategoryEntity extends CategoryBaseEntity {
  List<CategoryItemEntity> categoryList;

  CategoryEntity({required this.categoryList});
}

class CategoryItemEntity extends CategoryBaseEntity {
  IconData icon;
  String category;
  Color bgColor;
  Color accentColor;

  CategoryItemEntity(
      {required this.category,
      required this.icon,
      required this.bgColor,
      required this.accentColor});
}
