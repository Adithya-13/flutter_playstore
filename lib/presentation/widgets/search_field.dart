import 'package:flutter/material.dart';

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
