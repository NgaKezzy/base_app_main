// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a vi locale. All the
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
  String get localeName => 'vi';

  static String m0(username) => "Đăng nhập dưới tên ${username}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "badCertificate": MessageLookupByLibrary.simpleMessage(
      "Chứng chỉ không hợp lệ",
    ),
    "badResponse": MessageLookupByLibrary.simpleMessage("Lỗi phản hồi"),
    "changeLanguage": MessageLookupByLibrary.simpleMessage("Thay đổi ngôn ngữ"),
    "checkInternet": MessageLookupByLibrary.simpleMessage(
      "Vui lòng kiểm tra kết nối internet",
    ),
    "connectionError": MessageLookupByLibrary.simpleMessage("Lỗi kết nối"),
    "connectionTimeout": MessageLookupByLibrary.simpleMessage(
      "Hết thời gian kết nối",
    ),
    "dark": MessageLookupByLibrary.simpleMessage("Tối"),
    "english": MessageLookupByLibrary.simpleMessage("Tiếng Anh"),
    "home": MessageLookupByLibrary.simpleMessage("Trang chủ"),
    "language": MessageLookupByLibrary.simpleMessage("Ngôn ngữ"),
    "light": MessageLookupByLibrary.simpleMessage("Sáng"),
    "loggedInAs": m0,
    "login": MessageLookupByLibrary.simpleMessage("Đăng nhập"),
    "logout": MessageLookupByLibrary.simpleMessage("Đăng xuất"),
    "profile": MessageLookupByLibrary.simpleMessage("Hồ sơ"),
    "receiveTimeout": MessageLookupByLibrary.simpleMessage(
      "Hết thời gian nhận",
    ),
    "requestCanceled": MessageLookupByLibrary.simpleMessage("Yêu cầu bị hủy"),
    "sendTimeout": MessageLookupByLibrary.simpleMessage("Hết thời gian gửi"),
    "settings": MessageLookupByLibrary.simpleMessage("Cài đặt"),
    "system": MessageLookupByLibrary.simpleMessage("Hệ thống"),
    "theme": MessageLookupByLibrary.simpleMessage("Giao diện"),
    "unknown": MessageLookupByLibrary.simpleMessage("Lỗi không xác định"),
    "vietnamese": MessageLookupByLibrary.simpleMessage("Tiếng Việt"),
  };
}
