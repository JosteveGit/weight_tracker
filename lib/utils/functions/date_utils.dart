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

String getWeekday(int dayNumber, {bool capitalized = true}) {
  String weekday;
  switch (dayNumber) {
    case 1:
      weekday = "monday";
      break;
    case 2:
      weekday = "tuesday";
      break;
    case 3:
      weekday = "wednesday";
      break;
    case 4:
      weekday = "thursday";
      break;
    case 5:
      weekday = "friday";
      break;
    case 6:
      weekday = "saturday";
      break;
    case 7:
      weekday = "sunday";
      break;
  }
  if (capitalized) {
    return capitalize(weekday);
  }
  return weekday;
}

List<String> getWeekDays(String day) {
  String theDay = getSundayOfTheWeek(day);
  List<String> days = [];
  for (int i = 0; i < 7; i++) {
    days.add(theDay);
    theDay = getNextDay(theDay);
  }
  return days;
}

String getSundayOfTheWeek(String day) {
  //Get the week day first.
  int weekday = getWeekDayValue(day);
  //Get the sunday of the week.
  if (weekday == 7) {
    return day;
  }
  String sunday = day;
  int timeToLoop = weekday;
  for (int i = 0; i < timeToLoop; i++) {
    sunday = getPreviousDay(sunday);
  }
  return sunday;
}

String getPreviousDay(String day) {
  List<String> splitDate = day.split("/");
  if (isFirstDayOfTheMonth(day)) {
    return getLastDayOfPreviousMonth(day);
  }
  int previousDay = int.parse(splitDate.first) - 1;
  return "$previousDay/${splitDate[1]}/${splitDate.last}";
}

String getNextDay(String day) {
  List<String> splitDate = day.split("/");
  if (isLastDayOfTheMonth(day)) {
    if (splitDate[1] == "12") {
      return "1/1/${int.parse(splitDate.last) + 1}";
    }
    return "1/${int.parse(splitDate[1]) + 1}/${splitDate.last}";
  } else {
    int nextDayValue = int.parse(splitDate.first) + 1;
    return "$nextDayValue/${splitDate[1]}/${splitDate.last}";
  }
}

bool isFirstDayOfTheMonth(String day) {
  List<String> splitDate = day.split("/");
  return splitDate.first == "1" || splitDate.first == "01";
}

bool isLastDayOfTheMonth(String day) {
  List<String> splitDate = day.split("/");
  int monthValue = int.parse(splitDate[1]);
  int dayValue = int.parse(splitDate.first);
  int year = int.parse(splitDate.last);

  //September, April, June, November = 30;
  //February (isLeap) = 29 : 28;
  //Else 31;

  List<int> thirtyMonths = [4, 7, 9, 11];
  int februaryLastDate = 28;
  if (year % 4 == 0) {
    //Is Leap
    februaryLastDate = 29;
  }

  if (dayValue == 31) {
    return true;
  } else if (dayValue == 30 && thirtyMonths.contains(monthValue)) {
    return true;
  } else if (monthValue == 2 && dayValue == februaryLastDate) {
    return true;
  }
  return false;
}

String getLastDayOfPreviousMonth(String day) {
  List<String> splitDate = day.split("/");
  int monthValue = int.parse(splitDate[1]);
  int year = int.parse(splitDate.last);

  List<int> thirtyMonths = [4, 7, 9, 11];
  int februaryLastDate = 28;
  if (year % 4 == 0) {
    //Is Leap
    februaryLastDate = 29;
  }

  if (monthValue == 1) {
    return "31/12/${year - 1}";
  }

  int previousMonthValue = monthValue - 1;
  if (thirtyMonths.contains(previousMonthValue)) {
    return "30/$previousMonthValue/$year";
  } else if (previousMonthValue == 2) {
    return "$februaryLastDate/2/$year";
  }

  return "31/$previousMonthValue/$year";
}

int getWeekDayValue(String theDay) {
  if (theDay != null) {
    var splitDate = theDay.split("/");
    var monthPrefix = splitDate[1].length == 1 ? "0" : "";
    String day =
        splitDate.first.length < 2 ? "0${splitDate.first}" : splitDate.first;
    int weekday = DateTime.parse(
            "${splitDate.last}-$monthPrefix${splitDate[1]}-$day" + " 12:00:00")
        .weekday;
    return weekday;
  }
  return 0;
}

String formatDate(String date, [bool withDate = true]) {
  DateTime dateTime = DateTime.parse(date);
  return "${zeroPrefixNumber(dateTime.day)} ${getMonth(dateTime.month, capitalized: true).substring(0, 3)} ${dateTime.year} ${withDate ? ", ${zeroPrefixNumber(dateTime.hour)}:${zeroPrefixNumber(dateTime.minute)}" : ""} ";
}
