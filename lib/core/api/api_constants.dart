class ApiConstants {
  static const String baseUrl = "http://192.168.29.218:3000/api/";

  static const String registerEp = "users/register";
  static const String generateOtp = "users/generateOtp";
  static const String verifyOtp = "users/verifyOtp";

  static const String createTrip = 'trips/create';
  static const String feedTrips = 'trips/list';
  static String getAllTrips(String id) => 'trips/$id';
  static String deleteTrips(String id) => 'trips/$id';
  static String updateTrip(String id) => 'trips/$id';
  static String getAllTripsByUserId(String userId) => 'trips/user/$userId';
}
