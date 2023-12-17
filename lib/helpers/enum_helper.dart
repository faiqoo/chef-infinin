class EnumHelpers {
  static String humanize<T>(T value) {
    return value.toString().split('.').last.toUpperCase();
  }
}

enum NavDrawerItem {
  home,
  module,
  projects,
  workspace,
}
