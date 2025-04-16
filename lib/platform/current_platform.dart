@PlatformDetector()
import 'package:platform_code_builder/platform_code_builder.dart';

@PlatformSpec(platformType: PlatformType.google, renameTo: 'currentPlatform')
const String currentPlatformIsGoogle = 'google';

@PlatformSpec(platformType: PlatformType.huawei, renameTo: 'currentPlatform')
const String currentPlatformIsHuawei = 'huawei';

@PlatformSpec(platformType: PlatformType.other, renameTo: 'currentPlatform')
const String currentPlatformIsOther = 'other';

@PlatformSpec(platformType: PlatformType.iphone, renameTo: 'currentPlatform')
const String currentPlatformIsIphone = 'iphone';

@PlatformSpec(platformType: PlatformType.debug, renameTo: 'currentPlatform')
const String currentPlatformIsDebug = 'debug';
