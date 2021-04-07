import 'package:flutter/material.dart';

abstract class BaseEntity {}

class TrendEntity extends BaseEntity {
  final List<TrendItemEntity> trendEntities;

  TrendEntity({required this.trendEntities});
}

class RecommendEntity extends BaseEntity{
  final List<RecommendItemEntity> recommendEntities;

  RecommendEntity({required this.recommendEntities});
}

class CategoryEntity extends BaseEntity{
  final List<CategoryItemEntity> categoryEntities;

  CategoryEntity({required this.categoryEntities});
}

class TrendItemEntity extends BaseEntity {
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

class CategoryItemEntity extends BaseEntity {
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

class RecommendItemEntity extends BaseEntity {
  String icon;
  String name;
  double rate;

  RecommendItemEntity(
      {required this.name, required this.icon, required this.rate});
}
