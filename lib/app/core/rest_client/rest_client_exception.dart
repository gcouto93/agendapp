import 'package:agenda_ja_app/app/core/rest_client/rest_client_response.dart';

class RestClientException implements Exception {
  String? message;
  int? statusCode;
  dynamic error;
  RestClientResponse response;

  RestClientException({
    this.message,
    this.statusCode,
    this.error,
    required this.response,
  });

  @override
  String toString() {
    return 'RestClientException: $message, Status Code: $statusCode, Error: $error, Response: ${response.data}';
  }
}
