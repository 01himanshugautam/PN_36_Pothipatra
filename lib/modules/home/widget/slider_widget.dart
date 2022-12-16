import 'package:flutter/material.dart';

import '../../../common/color_utils.dart';
import '../../../models/news_model.dart';

// ignore: must_be_immutable
class SliderWidget extends StatelessWidget {
  News news;
  SliderWidget(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              news.image.toString(),
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 60,
            decoration: BoxDecoration(
                color: ColorUtilities.colorBlack.withOpacity(0.6),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                border: Border.all(color: ColorUtilities.colorBlack, width: 1)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                news.postData!.postTitle.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                  color: ColorUtilities.colorWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
