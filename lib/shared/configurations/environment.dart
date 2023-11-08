import 'package:modee_emrc_app/shared/configurations/environments/local-config.dart';

import 'environments/base-config.dart';

class Environment {
  factory Environment(){
    return _singleton;
  }
  Environment._internal();

  static final Environment _singleton = Environment._internal();
  static const String LOCAL = 'LOCAL';

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig config = LocalConfig();
  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.LOCAL:
        return LocalConfig();
      default:
        return LocalConfig();
    }
  }
}