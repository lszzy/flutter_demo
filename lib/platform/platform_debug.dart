@PlatformAvailable()
@Available(platform: PlatformType.debug, code: '''
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
''')
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:platform_code_builder/platform_code_builder.dart';

export 'platform_debug.p.dart';

@Available(platform: PlatformType.all, rename: 'PlatformDebug')
class _PlatformDebug {
  @Available(platform: PlatformType.debug, not: true)
  static TransitionBuilder? materialBuilder;

  @Available(platform: PlatformType.debug, rename: 'materialBuilder', code: '''
  static TransitionBuilder? materialBuilder = (context, child) {
    return FwdebugFlutter.inspector(child: child!);
  };
  ''')
  static TransitionBuilder? materialBuilderDebug;
}
