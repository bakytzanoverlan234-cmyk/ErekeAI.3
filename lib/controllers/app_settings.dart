class AppSettings {
  static final AppSettings instance = AppSettings._internal();
  AppSettings._internal();

  dynamic user;

  Future<void> load() async {}
  Future<void> save() async {}
}
