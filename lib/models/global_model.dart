
import 'parent/model.dart';

class Global extends Model {
  String? nodeBaseUrl;
  String? apiPath;
  int? received;
  int? accepted;
  int? onTheWay;
  int? ready;
  int? inProgress;
  int? done;
  int? failed;

  Global();

  Global.fromJson(Map<String, dynamic> json) {
    nodeBaseUrl = json['node_base_url'].toString();
    apiPath = json['api_path'].toString();
    received = intFromJson(json, 'received');
    accepted = intFromJson(json, 'accepted');
    onTheWay = intFromJson(json, 'on_the_way');
    ready = intFromJson(json, 'ready');
    inProgress = intFromJson(json, 'in_progress');
    done = intFromJson(json, 'done');
    failed = intFromJson(json, 'failed');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['node_base_url'] = nodeBaseUrl;
    data['api_path'] = apiPath;
    return data;
  }
}
