import 'package:onesignal_flutter/onesignal_flutter.dart';

class OneSignalService {
  static OneSignal? _instance;

  OneSignalSService() {
    getInstance();
    _instance!.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    _instance!.setAppId('93aa3a7a-4f7d-41a1-b176-eef7496bbcff');
    _instance!.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });
    _instance!.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      event.complete(event.notification);
    });
    _instance!
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {});
    _instance!.setPermissionObserver((OSPermissionStateChanges changes) {});
  }

  static OneSignal? getInstance() {
    _instance ??= OneSignal.shared;
    return _instance;
  }

  Future<void> getUserTokenId() async {
    var deviceState = await _instance!.getDeviceState();
    if (deviceState != null || deviceState?.userId != null) {
      String tokenId = deviceState!.userId!;
      print("TOKEN ID: $tokenId");
    }
  }

  void handleSendNotification(
      {required String tokenId,
      required String title,
      required String desc}) async {
    var notification = OSCreateNotification(
        playerIds: [tokenId], content: desc, heading: title);
    await _instance!.postNotification(notification);
  }
}
