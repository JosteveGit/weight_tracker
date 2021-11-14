String zeroPrefixNumber(int number) => number < 10 ? "0$number" : "$number";

String capitalize(String it) => it.isEmpty
    ? it
    : it[0].toUpperCase() + it.substring(1, it.length).toLowerCase();
