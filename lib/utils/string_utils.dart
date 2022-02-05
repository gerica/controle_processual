extension CapExtension on String {
  String get inCaps => this.length > 0 ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach {
    String temp = this.toLowerCase();
    temp = temp.replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.inCaps).join(' ');
    return temp;
  }

  String get getFirstAndLast {
    List<String> letters = this.replaceAll(RegExp(' +'), ' ').split(' ');
    if (letters.length == 1) {
      return letters.first;
    } else if (letters.length > 1) {
      return '${letters.first} ${letters[letters.length - 1]}';
    }
    return '';
  }

  String showSizeMax(int max) {
    if (this.isNotEmpty) {
      int size = this.length;
      if (size >= max) {
        return '${this.substring(0, max)}...';
      }
    }
    return this;
  }
}
