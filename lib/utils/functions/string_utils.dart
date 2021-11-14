String numberSuffixWord(int number, String word) {
  if (word.toLowerCase().endsWith('y')) {
    return "$number ${number > 1 ? word.substring(0, word.length - 1) + "ies" : word}";
  }
  return "$number ${number > 1 ? word + "s" : word}";
}

String zeroPrefixNumber(int number) => number < 10 ? "0$number" : "$number";

String capitalize(String it) => it.isEmpty
    ? it
    : it[0].toUpperCase() + it.substring(1, it.length).toLowerCase();
