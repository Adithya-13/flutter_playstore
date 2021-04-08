import 'package:flutter/material.dart';
import 'package:flutter_playstore/data/entities/entities.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';
import 'package:flutter_playstore/presentation/pages/home/widgets/widgets.dart';

class HomePagination extends StatelessWidget {
  final HomeSuccess state;

  const HomePagination({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: state.hasReachedMax!
            ? state.baseEntities!.length
            : state.baseEntities!.length + 1,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (index >= state.baseEntities!.length) {
            return BottomLoader();
          } else if (state.baseEntities![index] is CategoryEntity) {
            return CategorySection();
          } else if (state.baseEntities![index] is TrendEntity) {
            return TrendingSection();
          } else if (state.baseEntities![index] is RecommendEntity) {
            return RecommendSection();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
