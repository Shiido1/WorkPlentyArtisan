enum GigType { freelance, home, live }

String? returnGigType(GigType? type) {
  switch (type) {
    case GigType.freelance:
      return 'FREELANCE';
    case GigType.home:
      return 'HOME';
    case GigType.live:
      return 'Live';
    default:
      return '';
  }
}
