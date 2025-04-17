class PlatformType {
  static const google = 1;

  static const huawei = 2;

  static const other = 4;

  static const iphone = 8;

  static const debug = 16;

  static const android = 7;

  static const ios = 24;

  static const all = 31;

  static int fromName(String name) => {
        'google': google,
        'huawei': huawei,
        'other': other,
        'iphone': iphone,
        'debug': debug,
        'android': android,
        'ios': ios,
        'all': all
      }[name]!;
}
