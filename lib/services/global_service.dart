import 'package:get/get.dart';
import 'package:pothipatra/common/helper.dart';
import 'package:pothipatra/models/global_model.dart';

class GlobalService extends GetxService {
  final global = Global().obs;

  Future<GlobalService> init() async {
    var response = await Helper.getJsonFile('config/global.json');
    global.value = Global.fromJson(response);
    return this;
  }

  String? get baseUrl => global.value.nodeBaseUrl;
}
