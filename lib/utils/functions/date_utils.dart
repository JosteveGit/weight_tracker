import 'string_utils.dart';

String getMonth(int monthNumber, {bool capitalized = false}) {
  String month;
  switch (monthNumber) {
    case 1:
      month = "january";
      break;
    case 2:
      month = "february";
      break;
    case 3:
      month = "march";
      break;
    case 4:
      month = "april";
      break;
    case 5:
      month = "may";
      break;
    case 6:
      month = "june";
      break;
    case 7:
      month = "july";
      break;
    case 8:
      month = "august";
      break;
    case 9:
      month = "september";
      break;
    case 10:
      month = "october";
      break;
    case 11:
      month = "november";
      break;
    case 12:
      month = "december";
      break;
  }
  if (capitalized) {
    return capitalize(month);
  }
  return month;
}

String formatDate(String date, [bool withDate = true]) {
  DateTime dateTime = DateTime.parse(date);
  return "${zeroPrefixNumber(dateTime.day)} ${getMonth(dateTime.month, capitalized: true).substring(0, 3)} ${dateTime.year} ${withDate ? ", ${zeroPrefixNumber(dateTime.hour)}:${zeroPrefixNumber(dateTime.minute)}" : ""} ";
}
