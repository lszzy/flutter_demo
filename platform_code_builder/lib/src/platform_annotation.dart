class PlatformAvailable {
  const PlatformAvailable();
}

class Available {
  final int platform;
  final String? rename;
  final bool not;
  final String? code;

  const Available({
    required this.platform,
    this.not = false,
    this.rename,
    this.code,
  });
}