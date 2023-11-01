class AppUrl {
  static const String baseUrl =
      'https://loving-badger-perfect.ngrok-free.app/api/v1';
  // static const String baseUrl = 'http://10.16.182.81/api/v1';
  static const String loginApi = '$baseUrl/auth/app/login';
  static const String otpApi = '$baseUrl/auth/app/verify-otp';
  static const String resendOtpApi = '$baseUrl/auth/resend-otp';
  static const String userListApi = '$baseUrl/tenant-users/profile';
  static const String registerApi = '$baseUrl/auth/register';
}
