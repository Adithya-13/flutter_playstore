import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';
import 'package:flutter_playstore/presentation/pages/home/widgets/widgets.dart';

class BodyHomeWidget extends StatelessWidget {
  const BodyHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeFailure) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is HomeSuccess) {
          if (state.baseEntities!.isEmpty) {
            return Center(
              child: Text('no app'),
            );
          }
          return HomePagination(state: state);
        } else {
          return Container();
        }
      },
    );
  }
}
