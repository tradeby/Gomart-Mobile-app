String convertTime(String timeString) {
  // Parse the input time string into hours and minutes
  if(timeString.contains('pm') || timeString.contains('am')){
    return timeString;
  }
  List<String> parts = timeString.split(':');
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[1]);

  // Determine whether the time is in the AM or PM
  String period = hours >= 12 ? 'pm' : 'am';

  // Convert the hours to 12-hour format
  hours = hours % 12;
  if (hours == 0) {
    hours = 12;
  }

  // Return the formatted time string
  return '$hours:${minutes.toString().padLeft(2, '0')} $period';
}
