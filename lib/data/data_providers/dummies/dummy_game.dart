import 'package:flutter_playstore/data/entities/entities.dart';

class DummyGame {
  static EditorChoiceEntity getEditorChoiceList() =>
      EditorChoiceEntity(editorChoiceList: [
        EditorChoiceItemEntity(
          preview:
              "https://play-lh.googleusercontent.com/aok0HKaMtZIgEfqV4yw64GZ4SUslxMRhjjqtNdF_kITm5n2j3YGbKILmcIQ8ctvqEeOV",
          name: "Clash Royale",
          icon:
              "https://media.pocketgamer.biz/2016/3/65594/clash-royale-icon-r225x.jpg",
        ),
        EditorChoiceItemEntity(
          preview:
              "https://cdn.supercell.com/supercell.com/210402131757/supercell.com/files/og_clashofclans.jpg",
          name: "Clash of Clans",
          icon:
              "https://icon-library.com/images/clash-of-clans-app-icon/clash-of-clans-app-icon-21.jpg",
        ),
        EditorChoiceItemEntity(
          preview:
              "https://cdn-image.hipwee.com/wp-content/uploads/2019/12/hipwee-gamepou.jpg",
          name: "Pou",
          icon:
              "https://play-lh.googleusercontent.com/xToRFw-mqA18HtizgutV0K1IouakfR8iJ3PW75u-1n1oxbP7hVfBMlgHWIwuUYKKS_s",
        ),
        EditorChoiceItemEntity(
          preview:
              "https://images.bisnis-cdn.com/posts/2020/03/12/1212315/games-pubg.jpg",
          name: "Player Unknown's Battleground",
          icon:
              "https://play-lh.googleusercontent.com/JRd05pyBH41qjgsJuWduRJpDeZG0Hnb0yjf2nWqO7VaGKL10-G5UIygxED-WNOc3pg",
        ),
        EditorChoiceItemEntity(
          preview:
              "https://cdn.akurat.co/images/uploads/images/akurat_20200922043651_1MrQTh.jpg",
          name: "Mobile Legends: Bang Bang",
          icon:
              "https://media.pocketgamer.biz/2017/7/78814/mobile-legends-bang-bang-icon-r225x.jpg",
        ),
      ]);

  static TopFreeEntity getTopFreeList() => TopFreeEntity(topFreeList: [
        TopFreeItemEntity(
          name: "Mobile Legends: Bang Bang",
          icon:
              "https://media.pocketgamer.biz/2017/7/78814/mobile-legends-bang-bang-icon-r225x.jpg",
          size: "119 MB",
          rate: 4.7,
        ),
        TopFreeItemEntity(
          name: "Player Unknown's Battleground",
          icon:
              "https://play-lh.googleusercontent.com/JRd05pyBH41qjgsJuWduRJpDeZG0Hnb0yjf2nWqO7VaGKL10-G5UIygxED-WNOc3pg",
          size: "120 MB",
          rate: 4.8,
        ),
        TopFreeItemEntity(
          name: "Pou",
          icon:
              "https://play-lh.googleusercontent.com/xToRFw-mqA18HtizgutV0K1IouakfR8iJ3PW75u-1n1oxbP7hVfBMlgHWIwuUYKKS_s",
          size: "25 MB",
          rate: 4.6,
        ),
        TopFreeItemEntity(
          name: "Clash of Clans",
          icon:
              "https://icon-library.com/images/clash-of-clans-app-icon/clash-of-clans-app-icon-21.jpg",
          size: "48 MB",
          rate: 4.7,
        ),
        TopFreeItemEntity(
          name: "Clash Royale",
          icon:
              "https://media.pocketgamer.biz/2016/3/65594/clash-royale-icon-r225x.jpg",
          size: "32 MB",
          rate: 4.8,
        ),
      ]);
}
