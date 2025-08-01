class AppConstants {
  static const String baseUrl = 'https://jodiethomas729.vercel.app/api/v1';
  static const String login = "${baseUrl}/auth/login";
  static const String register = "${baseUrl}/users/register";
  static const String forgotPassword = "${baseUrl}/users/forgot-password";
  static const String resendOtp = "${baseUrl}/users/resend-otp";
  static const String verifyOtp = "${baseUrl}/users/verify-otp";
  static const String changePassword = "${baseUrl}/users/change-password";
  static const String updatePassword = "${baseUrl}/users/update-password";
  static const String verifyOtpForgotPassword =
      "${baseUrl}  /users/verify-otp-forgot-password";
}
