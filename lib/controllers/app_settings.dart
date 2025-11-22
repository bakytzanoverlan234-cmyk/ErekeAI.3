class AppSettings {
  static final AppSettings instance = AppSettings._internal();
  AppSettings._internal();

  void clear() {
    print("AppSettings.clear() called (stub)");
  }
}
