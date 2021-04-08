import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playstore/logic/blocs/blocs.dart';
import 'package:shimmer/shimmer.dart';

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
                  shrinkWrap: true,
                  itemCount: state.trendEntity.trendEntities.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                                child: CachedNetworkImage(
                                  imageUrl: state
                                      .trendEntity.trendEntities[index].preview,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    child: Container(
                                      color: Colors.grey,
                                    ),
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                  ),
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
                                      child: CachedNetworkImage(
                                        imageUrl: state.trendEntity
                                            .trendEntities[index].icon,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Shimmer.fromColors(
                                          child: Container(
                                            color: Colors.grey,
                                          ),
                                          baseColor: Colors.grey[300]!,
                                          highlightColor: Colors.grey[100]!,
                                        ),
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
                                      state.trendEntity.trendEntities[index]
                                          .name,
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
                                          state.trendEntity.trendEntities[index]
                                              .size,
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          state.trendEntity.trendEntities[index]
                                              .rate
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
    );
  }
}

//Container(
//                 height: MediaQuery.of(context).size.height * 0.3,
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 child: ListView.builder(
//                   physics: BouncingScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   shrinkWrap: true,
//                   itemCount: 5,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: EdgeInsets.symmetric(horizontal: 10),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.max,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: MediaQuery.of(context).size.width * 0.74,
//                             child: AspectRatio(
//                               aspectRatio: 1.7,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: Shimmer.fromColors(
//                                     child: Container(
//                                       color: Colors.grey,
//                                     ),
//                                     baseColor: Colors.grey[700]!,
//                                     highlightColor: Colors.grey[100]!),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 10),
//                           Container(
//                             child: Row(
//                               children: [
//                                 Container(
//                                   height:
//                                       MediaQuery.of(context).size.width * 0.12,
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.black.withOpacity(0.5),
//                                         width: 0.5),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: AspectRatio(
//                                     aspectRatio: 1,
//                                     child: ClipRRect(
//                                       borderRadius: BorderRadius.circular(10),
//                                       child: Shimmer.fromColors(
//                                           child: Container(
//                                             color: Colors.grey,
//                                           ),
//                                           baseColor: Colors.grey[700]!,
//                                           highlightColor: Colors.grey[100]!),
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Container(
//                                       height: 10,
//                                       width: 100,
//                                       child: Shimmer.fromColors(
//                                           child: Container(
//                                             color: Colors.grey,
//                                           ),
//                                           baseColor: Colors.grey[700]!,
//                                           highlightColor: Colors.grey[100]!),
//                                     ),
//                                     SizedBox(height: 5),
//                                     Row(
//                                       children: [
//                                         Container(
//                                           height: 10,
//                                           width: 40,
//                                           child: Shimmer.fromColors(
//                                               child: Container(
//                                                 color: Colors.grey,
//                                               ),
//                                               baseColor: Colors.grey[700]!,
//                                               highlightColor:
//                                                   Colors.grey[100]!),
//                                         ),
//                                         SizedBox(width: 5),
//                                         Container(
//                                           height: 10,
//                                           width: 20,
//                                           child: Shimmer.fromColors(
//                                               child: Container(
//                                                 color: Colors.grey,
//                                               ),
//                                               baseColor: Colors.grey[700]!,
//                                               highlightColor:
//                                                   Colors.grey[100]!),
//                                         ),
//                                         SizedBox(
//                                           width: 4,
//                                         ),
//                                         Icon(
//                                           Icons.star,
//                                           color: Colors.grey,
//                                           size: 18,
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               );
