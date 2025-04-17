@PlatformDetector()
import 'package:platform_code_builder/platform_code_builder.dart';

@PlatformSpec(platformType: PlatformType.google, renameTo: 'currentPlatform')
const String _currentPlatformIsGoogle = 'google';

@PlatformSpec(platformType: PlatformType.huawei, renameTo: 'currentPlatform')
const String _currentPlatformIsHuawei = 'huawei';

@PlatformSpec(platformType: PlatformType.other, renameTo: 'currentPlatform')
const String _currentPlatformIsOther = 'other';

@PlatformSpec(platformType: PlatformType.iphone, renameTo: 'currentPlatform')
const String _currentPlatformIsIphone = 'iphone';

@PlatformSpec(platformType: PlatformType.debug, renameTo: 'currentPlatform')
const String _currentPlatformIsDebug = 'debug';
