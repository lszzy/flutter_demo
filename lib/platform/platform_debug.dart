@PlatformBuilder(import: false)
import 'package:platform_builder/platform_builder.dart';
@Available(platform: PlatformType.debug, code: '''
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
''')
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

@Available(platform: PlatformType.all, rename: 'PlatformDebug')
class _PlatformDebug {
  @Unavailable(platform: PlatformType.debug)
  static TransitionBuilder? materialBuilder;

  @Available(platform: PlatformType.debug, rename: 'materialBuilder', code: '''
  static TransitionBuilder? materialBuilder = (context, child) {
    return FwdebugFlutter.inspector(child: child!);
  };
  ''')
  static TransitionBuilder? materialBuilderDebug;
}
