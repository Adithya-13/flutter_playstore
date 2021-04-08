import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';
import 'package:flutter_playstore/presentation/widgets/widgets.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchField(),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.stars,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Editor's choice",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<EditorChoiceBloc, EditorChoiceState>(
                  builder: (context, state) {
                    if (state is EditorChoiceLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is EditorChoiceFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is EditorChoiceSuccess) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount:
                              state.editorChoiceEntity.editorChoiceList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.74,
                                    child: AspectRatio(
                                      aspectRatio: 1,
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.network(
                                                state
                                                    .editorChoiceEntity
                                                    .editorChoiceList[index]
                                                    .preview,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: Container(
                                              margin: EdgeInsets.all(10),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.12,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black
                                                              .withOpacity(0.5),
                                                          width: 0.5),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: AspectRatio(
                                                      aspectRatio: 1,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          state
                                                              .editorChoiceEntity
                                                              .editorChoiceList[
                                                                  index]
                                                              .icon,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    state
                                                        .editorChoiceEntity
                                                        .editorChoiceList[index]
                                                        .name,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
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
                            );
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Free",
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
                BlocBuilder<TopFreeBloc, TopFreeState>(
                  builder: (context, state) {
                    if (state is TopFreeLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is TopFreeFailure) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is TopFreeSuccess) {
                      return Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: state.topFreeEntity.topFreeList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.15,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            width: 0.5),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            state.topFreeEntity
                                                .topFreeList[index].icon,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.topFreeEntity
                                                .topFreeList[index].name,
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
                                                state.topFreeEntity
                                                    .topFreeList[index].size,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                state.topFreeEntity
                                                    .topFreeList[index].rate
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
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Icon(
                                      Icons.more_vert_rounded,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
