import 'dart:math' as math;

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../resources/theme/colors_manager.dart';

class NotificationService {
  static Future<void> _initAwesomeNotifications() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/app_icon',
      [
        NotificationChannel(
          channelGroupKey: 'notification_channel',
          channelKey: 'notification_channel_key',
          channelName: 'Notification Channel',
          channelDescription: 'Notification channel for receive notification.',
          defaultColor: ColorsManager.primary,
          ledColor: ColorsManager.white,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'notification_channel',
          channelGroupName: 'Notification Channel',
        ),
      ],
      debug: false,
    );
  }

  static Future<void> _setListeners() async {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: _onActionReceivedMethod,
      onNotificationCreatedMethod: (_) async {},
      onNotificationDisplayedMethod: (_) async {},
      onDismissActionReceivedMethod: (_) async {},
    );
  }

  static Future<void> _checkPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (isAllowed == false) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  @pragma('vm:entry-point')
  static Future<void> _onActionReceivedMethod(ReceivedAction receivedAction) async {}

  static Future<void> showNotification({
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        channelKey: 'notification_channel_key',
        groupKey: 'notification_channel',
        id: math.Random().nextInt(10000),
        title: title,
        body: body,
        actionType: ActionType.Default,
        bigPicture: 'asset://assets/icons/app_icon.png',
        fullScreenIntent: false,
      ),
    );
  }

  static Future<void> _initFirebaseMessaging() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    Stream<RemoteMessage> onMessageOpenedAppStream = FirebaseMessaging.onMessageOpenedApp;
    onMessageOpenedAppStream.listen((RemoteMessage event) async {});

    Stream<RemoteMessage> onMessageStream = FirebaseMessaging.onMessage;
    onMessageStream.listen(
      (RemoteMessage event) async {
        showNotification(
          title: event.notification!.title!,
          body: event.notification!.body!,
          payload: event.data,
        );
      },
    );
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

  static Future<RemoteMessage?> getInitialMessage() async {
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    return message;
  }

  static Future<void> initNotifications() async {
    await _initAwesomeNotifications();
    await _initFirebaseMessaging();
  }

  static Future<void> initListenersAndPermission() async {
    _setListeners();
    _checkPermission();
  }
}
