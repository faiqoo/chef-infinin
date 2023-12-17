extension StringHelper on String {
  String getShortName() {
    final trimmed = trim();
    if (trimmed.isNotEmpty) {
      final txtList = trimmed.split(' ');
      final hasMultiplePart = txtList.length > 1;
      return '${txtList[0][0].toUpperCase()}${hasMultiplePart ? txtList[1][0].toUpperCase() : ''}';
    } else {
      return '';
    }
  }

  String lastNDigits({int n = 6}) {
    return substring(length - n);
  }

  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String displaySubString() {
    return '${this[0].toUpperCase()}${substring(0, 10).toLowerCase()}';
  }
}
