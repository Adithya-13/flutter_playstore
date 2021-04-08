import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';

class RecommendSection extends StatelessWidget {
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
                "Recommended for you",
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
        BlocBuilder<RecommendBloc, RecommendState>(
          builder: (context, state) {
            if (state is RecommendLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is RecommendFailure) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is RecommendSuccess) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: MediaQuery.of(context).size.height * 0.17,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.recommendEntity.recommendEntities.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.1,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(state
                              .recommendEntity.recommendEntities[index].icon),
                        ),
                        SizedBox(height: 10),
                        Text(
                          state.recommendEntity.recommendEntities[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Center(
                          child: Row(
                            children: [
                              Text(
                                state.recommendEntity.recommendEntities[index]
                                    .rate
                                    .toString(),
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ],
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
