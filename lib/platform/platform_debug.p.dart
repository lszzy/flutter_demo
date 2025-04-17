// GENERATED CODE - DO NOT MODIFY BY HAND
// current platform is [debug]

// **************************************************************************
// PlatformGenerator
// **************************************************************************

import 'package:fwdebug_flutter/fwdebug_flutter.dart';

import 'package:flutter/material.dart';
import 'package:platform_code_builder/platform_code_builder.dart';

export 'platform_debug.p.dart';

@Available(platform: PlatformType.all, rename: 'PlatformDebug')
class PlatformDebug {
  static TransitionBuilder? materialBuilder = (context, child) {
    return FwdebugFlutter.inspector(child: child!);
  };
}
