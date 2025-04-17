@PlatformDetector()
@PlatformSpec(platformType: PlatformType.debug, code: '''
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
''')
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:platform_code_builder/platform_code_builder.dart';

@PlatformSpec(platformType: PlatformType.all, renameTo: 'PlatformDebug')
class _PlatformDebug {
  @PlatformSpec(platformType: PlatformType.debug, not: true)
  static TransitionBuilder? materialBuilder;

  @PlatformSpec(platformType: PlatformType.debug, renameTo: 'materialBuilder', code: '''
  static TransitionBuilder? materialBuilder = (context, child) {
    return FwdebugFlutter.inspector(child: child!);
  };
  ''')
  static TransitionBuilder? materialBuilderDebug;
}
