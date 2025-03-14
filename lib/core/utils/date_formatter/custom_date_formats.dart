import 'package:intl/intl.dart';

class CustomDateFormats {
  CustomDateFormats._();

  ///Jan 22, 2023
  static String formatUtcDate (DateTime date){


    // Convert UTC time to local time
    DateTime localTime = date.toLocal();

    // Format the local time in the desired format
    String formattedTime = DateFormat("MMM, dd, yyyy").format(localTime);

    return formattedTime;
  }

  static String dateDifference (String utcDateString){

    DateTime utcTime = DateTime.parse(utcDateString).toLocal();
    DateTime currentTime = DateTime.now();

    Duration difference = utcTime.difference(currentTime).abs();

    if (difference.inSeconds < 60) {
      return "${difference.inSeconds} seconds";
    } else if (difference.inMinutes < 60) {
      return "${difference.inMinutes} min";
    } else if (difference.inHours < 24) {
      return "${difference.inHours} hour";
    } else {
      return "${difference.inDays} days";
    }
  }

}

String convertAuditTimeToLocaleTime(String utcDateTime)  {
  // Parse UTC DateTime
  DateFormat dateFormat = DateFormat("dd MMM yyyy 'at' hh:mm:ss");
  DateTime parsedDateTime = dateFormat.parse(utcDateTime, true);

  // Convert to local time
  String localeDateTime = DateFormat("M/d/yyyy',' hh:mm:ss a").format(parsedDateTime.toLocal());

  return localeDateTime;
}