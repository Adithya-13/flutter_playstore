import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';

class CategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Categories",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "See all",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Categories",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "See all",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CategoryFailure) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is CategorySuccess) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.2,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categoryEntity.categoryEntities.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: state.categoryEntity
                                          .categoryEntities[index].bgColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          state.categoryEntity
                                              .categoryEntities[index].icon,
                                          color: state
                                              .categoryEntity
                                              .categoryEntities[index]
                                              .accentColor,
                                        ),
                                        Text(
                                          state.categoryEntity
                                              .categoryEntities[index].category,
                                          style: TextStyle(
                                            color: state
                                                .categoryEntity
                                                .categoryEntities[index]
                                                .accentColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }
}
