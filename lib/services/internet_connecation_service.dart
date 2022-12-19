// import 'dart:developer';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:get/get.dart';

// class InternetConnectionService extends GetxService {
//   ConnectivityResult result = ConnectivityResult.none;

//   Future<InternetConnectionService> init() async {
//     await getNetworkStatus();
//     return this;
//   }

//   getNetworkStatus() async {
//     log("getNetworkStatus");
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult res) {
//       log(res.toString());
//       // Get.put<InternetConnectionService>(result);
//       result = res;
//     });
//   }
// }
