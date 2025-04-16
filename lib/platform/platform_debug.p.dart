// GENERATED CODE - DO NOT MODIFY BY HAND
// current platform is [debug]

// **************************************************************************
// PlatformGenerator
// **************************************************************************

@PlatformDetector()
@PlatformSpec(platformType: PlatformType.debug)
import 'package:fwdebug_flutter/fwdebug_flutter.dart';
import 'package:flutter/material.dart';
import 'package:platform_code_builder/platform_code_builder.dart';

class PlatformDebug {
  @PlatformSpec(platformType: PlatformType.debug, renameTo: 'materialBuilder')
  static TransitionBuilder? materialBuilder = (context, child) {
    return FwdebugFlutter.inspector(child: child!);
  };
}
