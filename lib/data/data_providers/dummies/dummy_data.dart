import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playstore/data/entities/entities.dart';

class DummyData {
  static TrendEntity getTrendList() => TrendEntity(trendList: [
        TrendItemEntity(
            preview:
                "https://play-lh.googleusercontent.com/aok0HKaMtZIgEfqV4yw64GZ4SUslxMRhjjqtNdF_kITm5n2j3YGbKILmcIQ8ctvqEeOV",
            name: "Clash Royale",
            icon:
                "https://media.pocketgamer.biz/2016/3/65594/clash-royale-icon-r225x.jpg",
            size: "32 MB",
            rate: 4.8),
        TrendItemEntity(
            preview:
                "https://cdn.supercell.com/supercell.com/210402131757/supercell.com/files/og_clashofclans.jpg",
            name: "Clash of Clans",
            icon:
                "https://icon-library.com/images/clash-of-clans-app-icon/clash-of-clans-app-icon-21.jpg",
            size: "48 MB",
            rate: 4.7),
        TrendItemEntity(
            preview:
                "https://cdn-image.hipwee.com/wp-content/uploads/2019/12/hipwee-gamepou.jpg",
            name: "Pou",
            icon:
                "https://play-lh.googleusercontent.com/xToRFw-mqA18HtizgutV0K1IouakfR8iJ3PW75u-1n1oxbP7hVfBMlgHWIwuUYKKS_s",
            size: "25 MB",
            rate: 4.6),
        TrendItemEntity(
            preview:
                "https://images.bisnis-cdn.com/posts/2020/03/12/1212315/games-pubg.jpg",
            name: "Player Unknown's Battleground",
            icon:
                "https://play-lh.googleusercontent.com/JRd05pyBH41qjgsJuWduRJpDeZG0Hnb0yjf2nWqO7VaGKL10-G5UIygxED-WNOc3pg",
            size: "120 MB",
            rate: 4.8),
        TrendItemEntity(
            preview:
                "https://cdn.akurat.co/images/uploads/images/akurat_20200922043651_1MrQTh.jpg",
            name: "Mobile Legends: Bang Bang",
            icon:
                "https://media.pocketgamer.biz/2017/7/78814/mobile-legends-bang-bang-icon-r225x.jpg",
            size: "119 MB",
            rate: 4.7),
      ]);

  static RecommendEntity getRecommendList() => RecommendEntity(
        recommendList: [
          RecommendItemEntity(
            name: "Netflix",
            icon:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Netflix_icon.svg/1200px-Netflix_icon.svg.png",
            rate: 4.8,
          ),
          RecommendItemEntity(
            name: "Facebook",
            icon: "https://image.flaticon.com/icons/png/512/174/174848.png",
            rate: 4.8,
          ),
          RecommendItemEntity(
            name: "Instagram",
            icon:
                "https://www.freepnglogos.com/uploads/logo-ig-png/logo-ig-logo-instagram-ini-ada-varias-dan-transparan-33.png",
            rate: 4.8,
          ),
          RecommendItemEntity(
            name: "Gojek",
            icon:
                "https://pbs.twimg.com/profile_images/1153975468812406785/ONvxKr_G_400x400.jpg",
            rate: 4.8,
          ),
          RecommendItemEntity(
            name: "Tokopedia",
            icon:
                "https://toppng.com/uploads/preview/tokopedia-logo-icon-tokopedia-115638033660bhcr3nbcq.png",
            rate: 4.8,
          ),
        ],
      );

  static CategoryEntity getCategoryList() => CategoryEntity(categoryList: [
        CategoryItemEntity(
          category: "Music",
          icon: Icons.music_note,
          bgColor: Color(0xffffeef1),
          accentColor: Color(0xffe83325),
        ),
        CategoryItemEntity(
          category: "Entertainment",
          icon: Icons.movie,
          bgColor: Color(0xffe9efff),
          accentColor: Color(0xff508df2),
        ),
        CategoryItemEntity(
          category: "Shopping",
          icon: CupertinoIcons.cart,
          bgColor: Color(0xfffff5d8),
          accentColor: Color(0xFFF2E250),
        ),
        CategoryItemEntity(
          category: "Book",
          icon: Icons.book,
          bgColor: Color(0xFFEAFFE9),
          accentColor: Color(0xFF60F250),
        ),
      ]);
}
