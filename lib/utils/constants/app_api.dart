class AppApi {
  // Base URL for the API
  static const String _baseUrl = 'https://crypto-signals-ultimate.com/api/';

  static const String register = '${_baseUrl}register';
  static const String login = '${_baseUrl}login';
  static const String checkEmail = '${_baseUrl}check-email';
  static const String sendCode = '${_baseUrl}sendVerificationCode';
  static const String logOut = '${_baseUrl}logout';

  static const String slidersSignals = '${_baseUrl}sliders';
  static const String signals = '${_baseUrl}signals';
  static const String signalsDetails = '${_baseUrl}signals/';
  static const String notifis = '${_baseUrl}notifis';
  static const String history = '${_baseUrl}history/all';
}