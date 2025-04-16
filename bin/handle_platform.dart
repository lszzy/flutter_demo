import 'dart:io';

import 'package:chalkdart/chalk.dart';
import 'package:platform_code_builder/platform_type.dart';
import 'package:pubspec_manager/pubspec_manager.dart';

main(List<String> args) {
  var platformMaskCode = PlatformType.fromName(args.first);
  switch (platformMaskCode) {
    case PlatformType.google:
      resetPubspec();
      break;
    case PlatformType.huawei:
      resetPubspec();
      break;
    case PlatformType.other:
      resetPubspec();
      break;
    case PlatformType.iphone:
      resetPubspec();
      break;
    case PlatformType.debug:
      final pubspec = resetPubspec(autoSave: false);
      pubspec.dependencies.add(
        DependencyBuilderPubHosted(
          name: 'fwdebug_flutter',
          versionConstraint: 'any',
        ),
      );
      pubspec.save();
      stderr.writeln(
          '${chalk.yellow('[NOTICE]')} add [fwdebug_flutter] to [pubspec.yaml].');
      break;
  }
}

PubSpec resetPubspec({bool autoSave = true}) {
  final pubspec = PubSpec.load();
  final dependencies = pubspec.dependencies;
  if (dependencies.exists('fwdebug_flutter')) {
    dependencies.remove('fwdebug_flutter');
  }
  if (autoSave) {
    pubspec.save();
  }
  return pubspec;
}
