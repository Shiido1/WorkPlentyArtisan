enum GigType { FREELANCE, HOME, LIVE, UNKNOWN }

String? fromGigType(GigType? type) {
  switch (type) {
    case GigType.FREELANCE:
      return 'FREELANCE';
    case GigType.HOME:
      return 'HOME';
    case GigType.LIVE:
      return 'Live';
    default:
      return '';
  }
}

GigType? toGigType(String? type) {
  switch (type) {
    case 'FREELANCE':
      return GigType.FREELANCE;
    case 'HOME':
      return GigType.HOME;
    case 'LIVE':
      return GigType.LIVE;
    default:
      return GigType.UNKNOWN;
  }
}
