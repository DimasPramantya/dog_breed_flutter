import 'package:intl/intl.dart';

String formattedArticleDate(int seconds) {
  return DateFormat('E, MMM d yyyy').format(
    DateTime.fromMillisecondsSinceEpoch(seconds * 1000),
  );
}

String formattedHealthDate(String utcDate) {
  DateFormat utcFormat = DateFormat("MMMM dd, yyyy 'at' hh:mm:ss a 'UTC'");

  // Parse the UTC date string
  DateTime dateTimeUTC = utcFormat.parse(utcDate);

  // Convert the parsed date to the local timezone
  DateTime localDateTime = dateTimeUTC.add(const Duration(hours: 7));

  // Define the format of the local date string
  DateFormat localFormat = DateFormat("MMMM dd, yyyy 'at' hh:mm a");

  // Format the local date string
  String localDateString = localFormat.format(localDateTime);

  return localDateString;
}
