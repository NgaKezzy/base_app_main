// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(username) => "Logged in as ${username}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "badCertificate": MessageLookupByLibrary.simpleMessage("Bad certificate"),
    "badResponse": MessageLookupByLibrary.simpleMessage("Bad response"),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("Change Language"),
    "checkInternet": MessageLookupByLibrary.simpleMessage(
      "Please check your internet connection",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("Connection error"),
    "connectionTimeout": MessageLookupByLibrary.simpleMessage(
      "Connection timeout",
    ),
    "dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "light": MessageLookupByLibrary.simpleMessage("Light"),
    "loggedInAs": m0,
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "receiveTimeout": MessageLookupByLibrary.simpleMessage("Receive timeout"),
    "requestCanceled": MessageLookupByLibrary.simpleMessage("Request canceled"),
    "sendTimeout": MessageLookupByLibrary.simpleMessage("Send timeout"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown error"),
    "vietnamese": MessageLookupByLibrary.simpleMessage("Vietnamese"),
  };
}
