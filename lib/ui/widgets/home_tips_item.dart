import 'package:bank_sha/shared/box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/tip_model.dart';
import '../../shared/theme.dart';

class HomeTipsItem extends StatelessWidget {
  final TipModel tip;

  const HomeTipsItem({super.key, required this.tip});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
        width: 155.w,
        height: 176,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                tip.thubmnail.toString(),
                width: 155.w,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            12.heightBox,
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: Text(
                tip.title.toString(),
                style: blackTextStyle.copyWith(fontWeight: medium),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(tip.url.toString()))) {
      throw Exception('Could not launc ${tip.url.toString()}');
    }
  }
}
