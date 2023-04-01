import '../../enums/requestsPath/safari_requests.dart';

extension SafariPathExtension on ISafariPath {
  String get rawValue {
    switch (this) {
      case ISafariPath.all:
        return "/api/safari/${ISafariPath.all.name}";
      case ISafariPath.create:
        return "/api/safari/${ISafariPath.create.name}";
      case ISafariPath.filter:
        return "/api/safari/${ISafariPath.filter.name}";
    }
  }
}
