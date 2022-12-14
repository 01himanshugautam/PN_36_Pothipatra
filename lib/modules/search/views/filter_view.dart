import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pothipatra/modules/search/controller/search_controller.dart';
import 'package:pothipatra/modules/search/widget/filter_list_widget.dart';

import '../../../common/color_utils.dart';
import '../../global_widgets/font_style_util.dart';
import '../widget/search_list_widget.dart';

class FilterView extends GetView<SearchController> {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    controller.getFilterNews(arguments[3]);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back,
                color: Get.isDarkMode
                    ? ColorUtilities.colorWhite
                    : ColorUtilities.colorBlack)),
        elevation: 0,
        centerTitle: false,
        title: Text('${arguments[0].toString()}/${arguments[2].toString()}',
            style: FontStyleUtilities.f18(
                fontColor: Get.isDarkMode
                    ? ColorUtilities.colorWhite
                    : ColorUtilities.colorBlack,
                fontWeight: FWT.medium)),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FilterListWidget(),
      ),
    );
  }
}
