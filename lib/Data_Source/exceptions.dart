class AppException implements Exception {
  // ignore: prefer_typing_uninitialized_variables
  final _message;
  
AppException([this._message,]);
  
@override
  String toString() {
    return "$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message]) : super(message);
}