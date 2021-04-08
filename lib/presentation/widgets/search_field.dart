import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SearchField extends StatelessWidget {
  final String kImageUrl =
      "https://flutter.dev/images/catalog-widget-placeholder.png";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDateRangePicker(
          context: context,
          firstDate: DateTime(DateTime.now().day),
          lastDate: DateTime(DateTime.now().year + 1),
          initialDateRange: DateTimeRange(
            start: DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day),
            end: DateTime.now(),
          ),
        );
      },
      child: Container(
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: kImageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    child: CircleAvatar(
                      radius: 20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.1),
                        child: Container(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                  ),
                ),
              ),
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
      ),
    );
  }
}
