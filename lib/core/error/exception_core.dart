import 'dart:io';

import 'package:woodman_project_fe/core/error/failure_core.dart';

class ExceptionCore {
  static Failure handleError(Exception e) {
    if (e is HandshakeException) {
      return Failure(
          message:
              'Something went wrong with your connection, please try again with new connection or use VPN',
          code: 500);
    }
    if (e is SocketException) {
      return Failure(
          message:
              'Something went wrong, please check your connection and try again',
          code: 500);
    }
    if (e is FormatException) {
      return Failure(
          message: 'Something went wrong with the server, please try again',
          code: 500);
    }

    return Failure(message: e.toString(), code: 500);
  }
}
