import 'package:flutter/material.dart';
import 'package:pothipatra/common/asset_utils.dart';
import 'package:pothipatra/common/color_utils.dart';
import 'package:pothipatra/models/feed_item_model.dart';
import 'package:pothipatra/modules/global_widgets/font_style_util.dart';
import 'package:pothipatra/modules/global_widgets/sizes_box.dart';

class FeedListItemWidget extends StatelessWidget {
  FeedItemModel? feedItemModel;
  FeedListItemWidget({super.key, this.feedItemModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AssetUtilities.defaultImage,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          wSizedBox1,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feedItemModel!.countryname.toString(),
                  style: FontStyleUtilities.f13(
                      fontColor: Colors.grey.shade400, fontWeight: FWT.regular),
                ),
                Text(feedItemModel!.desc.toString(),
                    style: FontStyleUtilities.f14(
                        fontColor: ColorUtilities.colorBlack,
                        fontWeight: FWT.regular)),
                hSizedBox,
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.asset(
                        AssetUtilities.bbcnews,
                        width: 18,
                        fit: BoxFit.cover,
                      ),
                    ),
                    wSizedBox,
                    Text(
                      feedItemModel!.newsName.toString(),
                      style: FontStyleUtilities.f11(
                          fontColor: ColorUtilities.colorBlack,
                          fontWeight: FWT.semiBold),
                    ),
                    wSizedBox,
                    Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey.shade500,
                      size: 18,
                    ),
                    wSizedBox,
                    Text(
                      feedItemModel!.time.toString(),
                      style: FontStyleUtilities.f11(
                          fontColor: ColorUtilities.colorBlack,
                          fontWeight: FWT.regular),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
