class Error500 {
  final bool success;
  final String statusCode;
  final String message;

  Error500({
    required this.success,
    required this.statusCode,
    required this.message,
  });
}
