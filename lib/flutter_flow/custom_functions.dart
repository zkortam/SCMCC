import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

bool stringInArr(
  String text,
  List<String> arr,
) {
  if (arr.contains(text)) {
    return true;
  } else {
    return false;
  }
}

int countPrayerAttendees(
  List<AttendeeRecordsStruct> attendeeRecords,
  DateTime prayerTime1,
  String currentDateTime,
  DateTime prayerTime2,
) {
  // Parse the currentDateTime string to a DateTime object for the current date
  DateTime currentDT = DateTime.parse(currentDateTime);

  // Convert prayer times to TimeOfDay for easier comparison
  TimeOfDay time1 =
      TimeOfDay(hour: prayerTime1.hour, minute: prayerTime1.minute);
  TimeOfDay time2 =
      TimeOfDay(hour: prayerTime2.hour, minute: prayerTime2.minute);

  int attendeeCount = 0;

  // Iterate through the list of attendee records
  for (AttendeeRecordsStruct record in attendeeRecords) {
    // Ensure date is not null and check if it's for the current day
    if (record.date?.year == currentDT.year &&
        record.date?.month == currentDT.month &&
        record.date?.day == currentDT.day) {
      // Convert record date to TimeOfDay
      TimeOfDay recordTime =
          TimeOfDay(hour: record.date!.hour, minute: record.date!.minute);

      // Check if the record time is after prayerTime1 and before prayerTime2
      bool isAfterTime1 = (recordTime.hour > time1.hour) ||
          (recordTime.hour == time1.hour && recordTime.minute >= time1.minute);
      bool isBeforeTime2 = (recordTime.hour < time2.hour) ||
          (recordTime.hour == time2.hour && recordTime.minute < time2.minute);

      if (isAfterTime1 && isBeforeTime2) {
        // Increment count if a record matches the criteria
        attendeeCount++;
      }
    }
  }

  return attendeeCount; // Return the count of attendees for the current day within the specified times
}

bool isSameDate(
  DateTime postDateTime,
  DateTime userCurrentDateTime,
) {
  return postDateTime.year == userCurrentDateTime.year &&
      postDateTime.month == userCurrentDateTime.month &&
      postDateTime.day == userCurrentDateTime.day;
}

String randomImage(
  String str1,
  String str2,
  String str3,
  String str4,
  String str5,
) {
  int randomNumber = math.Random().nextInt(5);
  List<String> urls = [str1, str2, str3, str4, str5];

  return urls[randomNumber];
}

String calculateTimeDifference(
  DateTime currentTime,
  String inputString,
  DateTime fajrTime,
  DateTime duhrTime,
  DateTime asrTime,
  DateTime maghribTime,
  DateTime ishaTime,
  DateTime jumaaTime,
) {
  String lowerInput = inputString.toLowerCase();

  DateTime? targetTime;

  // Check for each prayer time and assign the respective DateTime
  if (lowerInput.contains("fajr")) {
    targetTime = fajrTime;
  } else if (lowerInput.contains("dhuhr") ||
      lowerInput.contains("duhr") ||
      lowerInput.contains("zuhur") ||
      lowerInput.contains("zuhr") ||
      lowerInput.contains("dhuhur") ||
      lowerInput.contains("thuhur") ||
      lowerInput.contains("thuhr")) {
    targetTime = duhrTime;
  } else if (lowerInput.contains("asr")) {
    targetTime = asrTime;
  } else if (lowerInput.contains("maghrib")) {
    targetTime = maghribTime;
  } else if (lowerInput.contains("isha") ||
      lowerInput.contains("ishaa") ||
      lowerInput.contains("eshaa")) {
    targetTime = ishaTime;
  } else if (lowerInput.contains("jumaa")) {
    targetTime = jumaaTime;
  }

  // If no matching prayer time is found or if the prayer time has passed, return "none"
  if (targetTime == null || currentTime.isAfter(targetTime)) return "none";

  // Calculate the time difference in hours and minutes
  int differenceInMinutes = targetTime.difference(currentTime).inMinutes;
  int hours = differenceInMinutes ~/ 60;
  int minutes = differenceInMinutes % 60;

  // Format the time difference string
  String timeString;
  if (hours > 0) {
    timeString = "${hours}h ${minutes}m";
  } else {
    timeString = "${minutes}m";
  }

  return "$timeString remaining until Iqama";
}

String getNextPrayer(
  DateTime currentTime,
  DateTime fajrTime,
  DateTime duhrTime,
  DateTime asrTime,
  DateTime maghribTime,
  DateTime ishaTime,
  DateTime jumaaTime,
) {
  // Convert DateTime to minutes since midnight
  int currentTimeInMinutes = currentTime.hour * 60 + currentTime.minute;
  int fajrInMinutes = fajrTime.hour * 60 + fajrTime.minute;
  int duhrInMinutes = duhrTime.hour * 60 + duhrTime.minute;
  int asrInMinutes = asrTime.hour * 60 + asrTime.minute;
  int maghribInMinutes = maghribTime.hour * 60 + maghribTime.minute;
  int ishaInMinutes = ishaTime.hour * 60 + ishaTime.minute;

  // Compare current time with prayer times in minutes
  if (currentTimeInMinutes >= fajrInMinutes &&
      currentTimeInMinutes < duhrInMinutes) {
    return 'duhr';
  } else if (currentTimeInMinutes >= duhrInMinutes &&
      currentTimeInMinutes < asrInMinutes) {
    return 'asr';
  } else if (currentTimeInMinutes >= asrInMinutes &&
      currentTimeInMinutes < maghribInMinutes) {
    return 'maghrib';
  } else if (currentTimeInMinutes >= maghribInMinutes &&
      currentTimeInMinutes < ishaInMinutes) {
    return 'isha';
  } else {
    return 'fajr';
  }
}

List<AttendeeRecordsStruct> attendeeUpdater(
  String userId,
  List<AttendeeRecordsStruct> attendeeRecords,
  DateTime prayerTime,
  String currentDateTime,
) {
// Parse the currentDateTime string to a DateTime object
  DateTime currentDT = DateTime.parse(currentDateTime);

  // Create a new list from the original to avoid modifying it while iterating
  List<AttendeeRecordsStruct> updatedRecords =
      List<AttendeeRecordsStruct>.from(attendeeRecords);

  // Check if the current time is before the prayer time on the same day
  bool isBeforePrayerTime = currentDT.hour < prayerTime.hour ||
      (currentDT.hour == prayerTime.hour &&
          currentDT.minute < prayerTime.minute);

  if (!isBeforePrayerTime) {
    // If the current time is after the prayer time, don't remove any record
    return attendeeRecords;
  }

  // Find the index of the record where the user has agreed to attend today's prayer
  // Ensuring that we safely access the nullable date property
  int recordIndex = updatedRecords.indexWhere((record) =>
      record.id == userId &&
      record.date?.year == currentDT.year &&
      record.date?.month == currentDT.month &&
      record.date?.day == currentDT.day);

  // If a matching record is found, remove it
  if (recordIndex != -1) {
    updatedRecords.removeAt(recordIndex);
  }

  return updatedRecords; // Return the updated list of records
}

bool hasAttendedOnDate(
  List<AttendeeRecordsStruct> attendeeRecords,
  String userId,
  DateTime? dateTime,
) {
  // Filter the records to get only those that match the user's ID
  var userRecords =
      attendeeRecords.where((record) => record.id == userId).toList();

  // Check if any of the user's records have the same date (ignoring time) as the inputted dateTime
  for (var record in userRecords) {
    if (record.date?.year == dateTime?.year &&
        record.date?.month == dateTime?.month &&
        record.date?.day == dateTime?.day) {
      return true; // A matching record is found
    }
  }

  return false; // No matching record found
}

int countAttendeesOnDate(
  List<AttendeeRecordsStruct> attendeeRecords,
  DateTime? dateTime,
) {
  int count = 0;
  // Iterate through the records and count those that match the date
  for (var record in attendeeRecords) {
    if (record.date?.year == dateTime?.year &&
        record.date?.month == dateTime?.month &&
        record.date?.day == dateTime?.day) {
      count += 1; // Increment count for each matching record
    }
  }

  return count; // Return the total count of matching records
}

bool hasUserAgreed(
  String userId,
  List<AttendeeRecordsStruct> attendeeRecords,
  DateTime prayerTime,
  String currentDateTime,
) {
// Parse the currentDateTime string to a DateTime object
  DateTime currentDT = DateTime.parse(currentDateTime);
  // Get the current time of day
  TimeOfDay currentTimeOfDay =
      TimeOfDay(hour: currentDT.hour, minute: currentDT.minute);
  // Get the prayer time of day
  TimeOfDay prayerTimeOfDay =
      TimeOfDay(hour: prayerTime.hour, minute: prayerTime.minute);

  // Check if the current time is before the prayer time on the same day
  if (currentTimeOfDay.hour > prayerTimeOfDay.hour ||
      (currentTimeOfDay.hour == prayerTimeOfDay.hour &&
          currentTimeOfDay.minute >= prayerTimeOfDay.minute)) {
    // If the current time is after or equal to the prayer time, the user cannot have agreed to attend
    return false;
  }

  // Filter out records for the current date and matching userId
  return attendeeRecords.any((record) {
    DateTime? recordDate = record.date;
    // Ensure 'date' is not null and 'id' matches before accessing properties
    return recordDate != null &&
        record.id == userId &&
        recordDate.year == currentDT.year &&
        recordDate.month == currentDT.month &&
        recordDate.day == currentDT.day;
  });
}

DateTime convertTimeStringToDateTime(String timeString) {
  // Get the current date
  final now = DateTime.now();

  // Split the time string into hours and minutes
  final parts = timeString.split(":");

  // Default to "00:00" if the format is incorrect
  if (parts.length != 2) {
    return DateTime(now.year, now.month, now.day, 0, 0);
  }

  final hours = int.tryParse(parts[0]);
  final minutes = int.tryParse(parts[1]);

  // Default to "00:00" if parsing fails
  if (hours == null || minutes == null) {
    return DateTime(now.year, now.month, now.day, 0, 0);
  }

  // Create a new DateTime object using the current date and provided time, then add 5 minutes
  return DateTime(now.year, now.month, now.day, hours, minutes)
      .add(Duration(minutes: 5));
}

String jSONtoSTR(dynamic text) {
  return text.toString();
}

int adder(int arg) {
  return arg + 1;
}

bool isUserRegistered(
  DocumentReference user,
  List<DocumentReference> registrants,
) {
  if (registrants.contains(user)) {
    return true;
  } else {
    return false;
  }
}

bool isCurrentDay(
  DateTime currentTime,
  DateTime eventTime,
) {
  return currentTime.year == eventTime.year &&
      currentTime.month == eventTime.month &&
      currentTime.day == eventTime.day;
}

int strToInt(String str) {
  return int.parse(str);
}

int voterInList(
  DocumentReference userReference,
  List<VotersStruct> voters,
) {
  /// Check if the voters list or userReference is null
  if (voters == null || userReference == null) {
    return 0; // No reaction if voters list or user reference is null
  }

  /// Iterate through the list of voters
  for (final voter in voters) {
    // Check if the current voter's UserReference matches the given userReference
    if (voter.userReference == userReference) {
      return voter.voteValue;
    }
  }

  // If no matching UserReference is found, return 0
  return 0;
}

int calculateNetVotes(List<VotersStruct> voters) {
  // Check if voters list is null
  if (voters == null) {
    return 0; // Return 0 if the list is null
  }

  int netVotes = 0;

  // Iterate through the list of voters to sum up the vote values
  for (final voter in voters) {
    netVotes += voter.voteValue;
  }

  // Return the net sum of all vote values
  return netVotes;
}

int identifySocialMediaPlatform(String link) {
  if (link.contains('twitter.com') ||
      link.contains('t.co') ||
      link.contains('x.com')) {
    return 10; // Twitter
  } else if (link.contains('instagram.com') || link.contains('instagr.am')) {
    return 1; // Instagram
  } else if (link.contains('facebook.com') ||
      link.contains('fb.com') ||
      link.contains('fb.me') ||
      link.contains('fbsbx.com')) {
    return 2; // Facebook
  } else if (link.contains('youtube.com') ||
      link.contains('youtu.be') ||
      link.contains('youtubekids.com')) {
    return 3; // YouTube
  } else if (link.contains('tiktok.com') || link.contains('vm.tiktok.com')) {
    return 4; // TikTok
  } else if (link.contains('gettr.com')) {
    return 5; // Gettr
  } else if (link.contains('linkedin.com') || link.contains('lnkd.in')) {
    return 7; // LinkedIn
  } else if (link.contains('rumble.com')) {
    return 8; // Rumble
  } else if (link.contains('github.com') || link.contains('git.io')) {
    return 9; // GitHub
  } else if (link.contains('snapchat.com') || link.contains('sc.com')) {
    return 11; // Snapchat
  } else if (link.contains('reddit.com') || link.contains('redd.it')) {
    return 12; // Reddit
  } else if (link.contains('discord.com') || link.contains('discord.gg')) {
    return 13; // Discord
  } else if (link.contains('spotify.com') || link.contains('spoti.fi')) {
    return 14; // Spotify
  } else {
    return -1; // Unrecognized or other platform
  }
}

double? votePercent(
  List<VotersStruct> voters,
  int targetVoteValue,
) {
  if (voters.isEmpty) {
    return 0.0; // Return 0.0 for safety
  }

  // Count instances of targetVoteValue in the voters list
  int count =
      voters.where((voter) => voter.voteValue == targetVoteValue).length;

  // Calculate the percentage, multiply by 100, and round
  return (count / voters.length);
}

int roundAndMultiply(double value) {
  return (value * 100).round();
}

int isSecure(String link) {
  // Check if link explicitly starts with 'https://'
  if (link.startsWith('https://')) {
    return 1;
  }

  if (identifySocialMediaPlatform(link) != -1) {
    return 1;
  }

  // If it starts with 'http://', it's not secure
  if (link.startsWith('http://')) {
    return 0;
  }

  // If no protocol is provided, impartial
  return -1;
}

List<String> collecthashtags(String text) {
  return RegExp(r'#\w+')
      .allMatches(text)
      .map((match) => match.group(0)!)
      .toList();
}

String extractLink(String text) {
  final urlRegex = RegExp(
    r'((https?:\/\/)?(www\.)?[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(\/[^\s]*)?)\b',
    caseSensitive: false,
  );

  // Find the first match in the text
  final match = urlRegex.firstMatch(text);

  // Ensure the match is a valid URL format without spaces and contains at least one period
  if (match != null) {
    String url = match.group(0) ?? '';

    // Check if the match contains any spaces and at least one period
    if (!url.contains(' ') && url.contains('.')) {
      return url;
    }
  }

  // If no valid link is found, return an empty string
  return '';
}

List<String> fourOptionsToList(
  String option1,
  String option2,
  String option3,
  String option4,
) {
  return [
    option1.trim().isNotEmpty ? option1 : " ",
    option2.trim().isNotEmpty ? option2 : " ",
    option3.trim().isNotEmpty ? option3 : " ",
    option4.trim().isNotEmpty ? option4 : " ",
  ];
}

String refineTextThread(String text) {
  // Regular expression to match hashtags and URLs
  final pattern = RegExp(
      r'(#\w+|((https?:\/\/)?(www\.)?[a-zA-Z0-9\-]+\.[a-zA-Z]{2,}(:\d+)?(\/[^\s]*)?))');

  // Remove all hashtags and URLs
  return text.replaceAll(pattern, '').trim();
}

int stringLength(String string) {
  return string.length;
}

int subber(int x) {
  return x--;
}
