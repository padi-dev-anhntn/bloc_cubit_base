enum Flavor {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}
class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'Base-DEV';
      case Flavor.STAGING:
        return 'Base-STG';
      case Flavor.PRODUCTION:
        return 'Base-PRO';
      default:
        return 'Base';
    }
  }
}