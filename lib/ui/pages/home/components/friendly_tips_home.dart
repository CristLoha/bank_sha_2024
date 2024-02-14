import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import '../../../../shared/img_string.dart';
import '../../../../shared/theme.dart';
import '../../../widgets/home_tips_item.dart';

class FriendlyTipsHome extends StatelessWidget {
  const FriendlyTipsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          14.heightBox,
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 18,
              crossAxisSpacing: 17,
              childAspectRatio: 0.87,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              late String title;
              late String imageUrl;
              late String url;
              switch (index) {
                case 0:
                  title = "Best tips for using\na credit card";
                  imageUrl = ImgString.tips1;
                  url = 'https://www.google.com/';
                  break;
                case 1:
                  title = "Spot the good pie\nof finance model";
                  imageUrl = ImgString.tips2;
                  url = 'https://www.github.com/';
                  break;
                case 2:
                  title = "Great hack to get\nbetter advices";
                  imageUrl = ImgString.tips3;
                  url = 'https://pub.dev/';
                  break;
                case 3:
                  title = "Save more penny\nbuy this instead";
                  imageUrl = ImgString.tips4;
                  url = 'https://www.google.com/';
                  break;
                default:
              }
              return HomeTipsItem(
                  imageUrl: imageUrl, // Ganti dengan gambar sesuai indeks
                  title: title, // Ganti dengan judul sesuai indeks
                  url: url);
            },
          )
        ],
      ),
    );
  }
}
