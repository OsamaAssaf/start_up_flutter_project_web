import '../helpers/all_imports.dart';

class NotificationService {
  NotificationService._();

  static final NotificationService instance = NotificationService._();

  Future<void> _initAwesomeNotifications() async {
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

  Future<void> _setListeners() async {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: _onActionReceivedMethod,
      onNotificationCreatedMethod: (_) async {},
      onNotificationDisplayedMethod: (_) async {},
      onDismissActionReceivedMethod: (_) async {},
    );
  }

  Future<void> _checkPermission() async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (isAllowed == false) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  }

  @pragma('vm:entry-point')
  Future<void> _onActionReceivedMethod(ReceivedAction receivedAction) async {}

  Future<void> showNotification({
    required String title,
    required String body,
    Map<String, dynamic>? payload,
  }) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        channelKey: 'notification_channel_key',
        groupKey: 'notification_channel',
        id: Random().nextInt(10000),
        title: title,
        body: body,
        actionType: ActionType.Default,
        bigPicture: 'asset://assets/icons/app_icon.png',
        fullScreenIntent: false,
      ),
    );
  }

  Future<void> _initFirebaseMessaging() async {
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

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

  Future<RemoteMessage?> getInitialMessage() async {
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();
    return message;
  }

  Future<void> initNotifications() async {
    await _initAwesomeNotifications();
    await _initFirebaseMessaging();
  }

  Future<void> initListenersAndPermission() async {
    _setListeners();
    _checkPermission();
  }
}
