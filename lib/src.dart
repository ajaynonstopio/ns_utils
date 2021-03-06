library ns_utils;

import 'package:flutter/material.dart';
import 'package:ns_utils/services/shared_preferences/sp_service.dart';

export 'data_type/stackx.dart';
export 'extensions/context.dart';
export 'extensions/date_time.dart';
export 'extensions/double.dart';
export 'extensions/int.dart';
export 'extensions/list.dart';
export 'extensions/map.dart';
export 'extensions/string.dart';
export 'extensions/widgets/gesture_detector.dart';
export 'extensions/widgets/widgets.dart';
export 'methods/conversion.dart';
export 'utils/sizes.dart';
export 'widgets/spacers.dart';

class NSUtils {
  bool _isInitialized = false;
  bool _printLogs = false;

  bool get isInitialized => _isInitialized;

  bool get printLogs => _printLogs;

  static NSUtils instance = NSUtils();

  Future<Null> init({
    @required bool printLogs,
  }) async {
    _isInitialized = true;
    _printLogs = printLogs;
    await SPService.init();
  }
}
