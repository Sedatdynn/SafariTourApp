import '../../enums/requestsPath/accounts_requests.dart';

extension SafariPathExtension on IAccountPath {
  String get rawValue {
    switch (this) {
      case IAccountPath.all:
        return "/api/accounts/${IAccountPath.all.name}";

      case IAccountPath.login:
        return "/api/accounts/${IAccountPath.login.name}";

      case IAccountPath.profile:
        return "/api/accounts/${IAccountPath.profile.name}";

      case IAccountPath.token:
        return "/api/accounts/refresh/${IAccountPath.all.name}";

      case IAccountPath.register:
        return "/api/accounts/${IAccountPath.register.name}";
    }
  }
}
