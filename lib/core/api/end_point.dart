class EndPoint {
  //! user authentication End Point
  static String baseUrl = "https://carcareapp.runasp.net/api/";
  //User and technical end points
  static String acount = "account/";
  static String serviceRequest = "ServiceRequest/";

  static String login = "${acount}login";
  static String registerUser = "${acount}register/user";
  static String registerTechnical = "${acount}register/Technical";
  static String getCurrentUser = "${acount}GetCurrentUserByRole";
  static String getCurrentTechnical = "${acount}GetCurrentTechnical";
  static String changePassword = "${acount}Change-Password";
  static String getRefreshToken = "${acount}Get-Refresh-Token";
  static String revokeRefreshToken = "${acount}Revoke-Refresh-Token";
  static String forgetPasswordEmail = "${acount}ForgetPasswordEmail";
  static String verfiyCodeEmail = "${acount}VerfiyCodeEmail";
  static String resetPassword = "${acount}ResetPasswordEmail";
  static String confirmationCodeEmail = "${acount}ConfirmationCodeEmail";
  static String confirmEmail = "${acount}ConfirmEmail";
  static String updateUser = "${acount}UpdateAppUser";
  static String updateTechical = "${acount}UpdateTech";
  static String getAllServices = "ServiceTypes/GetAll";
  static String getAllTechinicalOrderedByDistanceAndRateEndPoint =
      "${serviceRequest}GetAvailableTechincals?";
  static String getAllTechinicalOrderedByDistanceEndPoint =
      "${serviceRequest}GetNearestTechincals?";

  //car end points
  static String car = "Vehicle/";
  static String dashBoard = "DashBoard/";
  static String createCar = "${car}Create-Vehicle";
  static String deleteCar = "${dashBoard}Delete-Vehicle/";
  static String getCarById = "${dashBoard}Get-Vehicle/";
  static String getAllCarsForSpecificUser =
      "${car}Get-All-Vehicle-For-SpecificUser";

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String data = "data";
  static String status = "status";
  static String statusCode = "statusCode";
  static String refreshTokenExpirationDate = "refreshTokenExpirationDate";
  static String refreshToken = "refreshToken";
  static String phoneNumber = "phoneNumber";
  static String resetCode = "resetCode";
  static String nationalId = "nationalId";
  static String token = "token";
  static String email = "email";
  static String id = "id";
  static String fullName = "fullName";
  static String type = "type";
  static String message = "message";
  static String password = "password";
  static String newPassword = "newPassword";
  static String profilePic = "profilePic";
  static String confimationCode = "confirmationCode";
  static String serviceName = "name";
  static String serviceDescription = "description";
  static String imageUrl = "pictureUrl";
  static String serviceId = "serviceId";
  static String model = "model";
  static String color = "color";
  static String year = "year";
  static String vinNumber = "viN_Number";
  static String plateNumber = "plateNumber";
  static String userId = "userId";
  static String distance = "distance";
  static String nameOfService = "serviceName";
}
