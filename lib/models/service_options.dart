import 'dart:ui';

import 'package:platform/platform.dart';

import 'foreground_task_options.dart';
import 'notification_button.dart';
import 'notification_icon.dart';
import 'notification_options.dart';

class ServiceStartOptions {
  const ServiceStartOptions({
    this.serviceId,
    required this.androidNotificationOptions,
    required this.iosNotificationOptions,
    required this.foregroundTaskOptions,
    required this.notificationContentTitle,
    required this.notificationContentText,
    /* 디아콘 추가 시작 */
    this.notificationLargeIconPath,
    /* 디아콘 추가 끝 */
    this.notificationIcon,
    this.notificationButtons,
    this.notificationInitialRoute,
    this.callback,
  });

  final int? serviceId;
  final AndroidNotificationOptions androidNotificationOptions;
  final IOSNotificationOptions iosNotificationOptions;
  final ForegroundTaskOptions foregroundTaskOptions;
  final String notificationContentTitle;
  final String notificationContentText;
  /* 디아콘 추가 시작 */
  final String? notificationLargeIconPath;
  /* 디아콘 추가 끝 */
  final NotificationIcon? notificationIcon;
  final List<NotificationButton>? notificationButtons;
  final String? notificationInitialRoute;
  final Function? callback;

  Map<String, dynamic> toJson(Platform platform) {
    final Map<String, dynamic> json = {
      'serviceId': serviceId,
      ...foregroundTaskOptions.toJson(),
      'notificationContentTitle': notificationContentTitle,
      'notificationContentText': notificationContentText,
      /* 디아콘 추가 시작 */
      'notificationLargeIconPath': notificationLargeIconPath,
      /* 디아콘 추가 끝 */
      'icon': notificationIcon?.toJson(),
      'buttons': notificationButtons?.map((e) => e.toJson()).toList(),
      'initialRoute': notificationInitialRoute,
    };

    if (platform.isAndroid) {
      json.addAll(androidNotificationOptions.toJson());
    } else if (platform.isIOS) {
      json.addAll(iosNotificationOptions.toJson());
    }

    if (callback != null) {
      json['callbackHandle'] =
          PluginUtilities.getCallbackHandle(callback!)?.toRawHandle();
    }

    return json;
  }
}

class ServiceUpdateOptions {
  const ServiceUpdateOptions({
    required this.foregroundTaskOptions,
    required this.notificationContentTitle,
    required this.notificationContentText,
    /* 디아콘 추가 시작 */
    this.notificationLargeIconPath,
    /* 디아콘 추가 끝 */
    this.notificationIcon,
    this.notificationButtons,
    this.notificationInitialRoute,
    this.callback,
  });

  final ForegroundTaskOptions? foregroundTaskOptions;
  final String? notificationContentTitle;
  final String? notificationContentText;
  /* 디아콘 추가 시작 */
  final String? notificationLargeIconPath;
  /* 디아콘 추가 끝 */
  final NotificationIcon? notificationIcon;
  final List<NotificationButton>? notificationButtons;
  final String? notificationInitialRoute;
  final Function? callback;

  Map<String, dynamic> toJson(Platform platform) {
    final Map<String, dynamic> json = {
      'notificationContentTitle': notificationContentTitle,
      'notificationContentText': notificationContentText,
      /* 디아콘 추가 시작 */
      'notificationLargeIconPath': notificationLargeIconPath,
      /* 디아콘 추가 끝 */
      'icon': notificationIcon?.toJson(),
      'buttons': notificationButtons?.map((e) => e.toJson()).toList(),
      'initialRoute': notificationInitialRoute,
    };

    if (foregroundTaskOptions != null) {
      json.addAll(foregroundTaskOptions!.toJson());
    }

    if (callback != null) {
      json['callbackHandle'] =
          PluginUtilities.getCallbackHandle(callback!)?.toRawHandle();
    }

    return json;
  }
}
