import 'dart:ui';

import 'package:flutter_foreground_task/utils/color_extension.dart';

/// A data class for dynamically changing the notification icon.
class NotificationIcon {
  /// Constructs an instance of [NotificationIcon].
  const NotificationIcon({
    required this.metaDataName,
    this.backgroundColor,
  }) : assert(metaDataName.length > 0);

  /// The name of the meta-data in the manifest that contains the drawable icon resource identifier.
  final String metaDataName;

  /// The background color for the notification icon.
  final Color? backgroundColor;

  /// Returns the data fields of [NotificationIcon] in JSON format.
  Map<String, dynamic> toJson() {
    final String? backgroundColorRgb = backgroundColor?.toRgbString;

    return {
      'metaDataName': metaDataName,
      'backgroundColorRgb': backgroundColorRgb,
    };
  }
}