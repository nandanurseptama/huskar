abstract class Env {
  String get name;
  String get baseUrl;
  String get loginUrl;

  String get secretPassword => "8ZWKSS9T91YGYPLQ";
  String get ivPassword => "U0YI357UREZIXKBH";

  static Env create() {
    var env = const String.fromEnvironment("env", defaultValue: "DEV");
    if (env == "DEV") {
      return EnvDev();
    }
    return EnvProd();
  }
}

class EnvDev extends Env {
  @override
  String get baseUrl => "https://reqres.in";

  String get suffix => "/api";

  @override
  String get loginUrl => "$baseUrl$suffix/login";

  @override
  String get name => "DEV";
}

class EnvProd extends Env {
  @override
  String get baseUrl => "https://reqres.in";

  String get suffix => "/api";

  @override
  String get loginUrl => "$baseUrl$suffix/login";

  @override
  String get name => "PROD";
}
