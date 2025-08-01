class RegistrationResponse {
  final bool success;
  final int statusCode;
  final String message;
  final Map<String, dynamic> data;

  RegistrationResponse({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      success: json['success'] ?? false,
      statusCode: json['statusCode'] ?? 0,
      message: json['message'] ?? '',
      data: json['data'] ?? {},
    );
  }

  String get otpMessage => data['message'] ?? '';
}
