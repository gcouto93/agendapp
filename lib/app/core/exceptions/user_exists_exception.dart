class UserExistsException implements Exception {
  final String message;

  UserExistsException(this.message);

  @override
  String toString() {
    return 'UserExistsException: $message';
  }
}
