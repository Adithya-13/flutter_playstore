import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SafeArea(
        child: Column(
          children: [
            SearchField(),
            TrendingSection(),
            RecommendSection(),
            CategorySection(),
          ],
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  final String kImageUrl =
      "https://flutter.dev/images/catalog-widget-placeholder.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: kElevationToShadow[2],
          color: Colors.white),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(kImageUrl),
          ),
          SizedBox(width: 20),
          Expanded(
              child: Text(
            "Search Google Play",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          )),
          Icon(
            Icons.mic,
            color: Colors.grey,
            size: 30,
          ),
        ],
      ),
    );
  }
}

class TrendingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Trending",
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
        BlocBuilder<TrendBloc, TrendState>(
          builder: (context, state) {
            if (state is TrendLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TrendFailure) {
              return Center(child: Text(state.message));
            } else if (state is TrendSuccess) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.trendEntity.trendList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.74,
                          child: AspectRatio(
                            aspectRatio: 1.7,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                state.trendEntity.trendList[index].preview,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      state.trendEntity.trendList[index].icon,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.trendEntity.trendList[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        state.trendEntity.trendList[index].size,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        state.trendEntity.trendList[index].rate
                                            .toString(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
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
                                ],
                              )
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
                  itemCount: state.recommendEntity.recommendList.length,
                  itemBuilder: (context, index) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.1,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              state.recommendEntity.recommendList[index].icon),
                        ),
                        SizedBox(height: 10),
                        Text(
                          state.recommendEntity.recommendList[index].name,
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
                                state.recommendEntity.recommendList[index].rate
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
                  itemCount: state.categoryEntity.categoryList.length,
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
                                          .categoryList[index].bgColor,
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
                                              .categoryList[index].icon,
                                          color: state.categoryEntity
                                              .categoryList[index].accentColor,
                                        ),
                                        Text(
                                          state.categoryEntity
                                              .categoryList[index].category,
                                          style: TextStyle(
                                            color: state
                                                .categoryEntity
                                                .categoryList[index]
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
