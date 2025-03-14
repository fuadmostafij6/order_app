import 'package:intl/intl.dart';

String formatDate({required DateTime dateTime}) {
  // Parse the input string as a DateTime
  String formattedDate = DateFormat("dd MMM yyyy, hh:mm a").format(dateTime);

  // Print the result
  return formattedDate;
}

// Helper function to ensure two digits in the output
String _twoDigits(int n) {
  if (n >= 10) {
    return "$n";
  } else {
    return "0$n";
  }
}