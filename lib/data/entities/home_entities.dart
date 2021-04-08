import 'package:flutter/material.dart';

abstract class HomeBaseEntity {}

class TrendEntity extends HomeBaseEntity {
  final List<TrendItemEntity> trendEntities;

  TrendEntity({required this.trendEntities});
}

class TrendItemEntity extends HomeBaseEntity {
  final String preview;
  final String icon;
  final String name;
  final String size;
  final double rate;

  TrendItemEntity(
      {required this.preview,
      required this.name,
      required this.icon,
      required this.size,
      required this.rate});
}

class RecommendEntity extends HomeBaseEntity {
  final List<RecommendItemEntity> recommendEntities;

  RecommendEntity({required this.recommendEntities});
}

class RecommendItemEntity extends HomeBaseEntity {
  final String icon;
  final String name;
  final double rate;

  RecommendItemEntity(
      {required this.name, required this.icon, required this.rate});
}

class CategoryEntity extends HomeBaseEntity {
  final List<CategoryItemEntity> categoryEntities;

  CategoryEntity({required this.categoryEntities});
}

class CategoryItemEntity extends HomeBaseEntity {
  final IconData icon;
  final String category;
  final Color bgColor;
  final Color accentColor;

  CategoryItemEntity(
      {required this.category,
      required this.icon,
      required this.bgColor,
      required this.accentColor});
}
