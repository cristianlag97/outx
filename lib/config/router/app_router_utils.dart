enum PAGES {
  splash,
  home,
  login,
  register,
  registerHeadquarters,
  gpsMap,
  venuesAndEvents,
}

extension AppScreenExtension on PAGES {
  String get screenPath {
    switch (this) {
      case PAGES.splash:
        return "/splash";
      case PAGES.login:
        return "/login";
      case PAGES.register:
        return "/register";
      case PAGES.registerHeadquarters:
        return "/register-headquarters";
      case PAGES.gpsMap:
        return "/gps-map";
      case PAGES.venuesAndEvents:
        return "/venues-and-events";
      case PAGES.home:
      default:
        return "/";
    }
  }

  String get screenName {
    switch (this) {
      case PAGES.splash:
        return "SPLASH";
      case PAGES.login:
        return "lOGIN";
      case PAGES.register:
        return "REGISTER";
      case PAGES.registerHeadquarters:
        return "REGISTER-HEADQUARTERS";
      case PAGES.gpsMap:
        return "GPS-MAP";
      case PAGES.venuesAndEvents:
        return "VENUES-AND-EVENTS";
      case PAGES.home:
      default:
        return "HOME";
    }
  }
}
