enum Environment {
  dev,
  stg,
  prod,
}

extension EnvironmentExt on Environment {
  String get envName {
    switch (this) {
      case Environment.dev:
        return 'DEV';
      case Environment.stg:
        return 'STG';
      case Environment.prod:
        return 'PROD';
    }
  }

  String get baseUrl {
    switch (this) {
      case Environment.dev:
        return "http://dev";
      case Environment.stg:
        return "http://stg";
      case Environment.prod:
        return "stg";
    }
  }

  String get httpGraphQLServiceLink {
    switch(this) {
      case Environment.dev:
        return "https://api.dev.live.boosty.app/graphiql";
      case Environment.stg:
        return "https://api.stg.live.boosty.app/graphiql";
      case Environment.prod:
        return "stg";
    }
  }
}
