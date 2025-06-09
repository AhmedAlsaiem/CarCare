class EndPoint {
  //! user authentication End Point
  static String baseUrl = "https://carcareapp.runasp.net/api/";
  //User and technical Authentication End points
  static String acount = "account/";
  static String serviceRequest = "ServiceRequest/";

  static String login = "${acount}login";
  static String registerUser = "${acount}register";
  static String registerTechnical = "${acount}register";
  static String getCurrentUser = "${acount}GetCurrentUserByRole";
  static String getCurrentTechnical = "${acount}GetCurrentTechnical";
  static String changePassword = "${acount}Change-Password";
  static String getRefreshToken = "${acount}Get-Refresh-Token";
  static String revokeRefreshToken = "${acount}Revoke-Refresh-Token";
 static String forgetPasswordEmail = "${acount}ForgetPasswordEmail";
  static String verfiyCodeEmail = "${acount}VerfiyCodeEmail";
  static String resetPassword = "${acount}ResetPasswordEmail";
  static String sendCodeByEmail = "${acount}SendCodeByEmail";
  static String confirmEmail = "${acount}ConfirmEmail";
  static String updateUser = "${acount}UpdateAppUser";
  static String updateTechical = "${acount}UpdateTech";
  static String getAllServices = "ServiceTypes/GetAll";

  //car end points
  static String car = "Vehicle/";
  static String dashBoard = "DashBoard/";
  static String createCar = "${car}Create-Vehicle";
  static String deleteCar = "${dashBoard}Delete-Vehicle/";
  static String getCarById = "${dashBoard}Get-Vehicle/";
  static String getAllCarsForSpecificUser =
      "${car}Get-All-Vehicle-For-SpecificUser";

//service request end points
  static String getAllTechinicalOrderedByDistanceAndRateEndPoint =
      "${serviceRequest}GetAvailableTechincals?";
  static String getAllTechinicalOrderedByDistanceEndPoint =
      "${serviceRequest}GetNearestTechincals?";
  static String createRequestManually =
      "${serviceRequest}CreateRequestManually";
  static String createRequestAutomatic =
      "${serviceRequest}CreateRequestAutomatic";
  static String getRequestDetails = "${serviceRequest}GetRequest/";
  static String getAllRequestesForUser = "${serviceRequest}GetAllRequests";
  static String updateTechinicalInRequest =
      "${serviceRequest}Update-Technical-in-Request?";
  static String deleteOrCancleForUser =
      "${serviceRequest}DeleteRequestForUser/";
  static String cheeckStatus = "${serviceRequest}CheckStatus/";
  static String getAllContacts = "Contact/GetAllMessages";
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
  static String fristCare = "fristCare";
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
  //service request api key
  static String serviceTypeId = "serviceTypeId";
  static String techId = "techId";
  static String typeOfWinch = "typeOfWinch";
  static String userLatitude = "userLatitude";
  static String userLongitude = "userLongitude";
  static String servicePrice = "servicePrice";
  static String techName = "techName";
  static String techJop = "techJop";
  static String bettaryType = "bettaryType";
  static String typeOfFuel = "typeOfFuel";
  static String typeOfOil = "typeOfOil";
  static String tireSize = "tireSize";
  static String serviceQuantity = "serviceQuantity";
  static String userName = "userName";
  static String busnissStatus = "busnissStatus";
  static String paymentStatus = "paymentStatus";
  static String createdBy = "createdBy";
  static String createdOn = "createdOn";
  static String paymentIntentId = "paymentIntentId";
  static String clientSecret = "clientSecret";
  static String lastModifiedBy = "lastModifiedBy";
  static String messageFor = "messageFor";
  static String lastModifiedOn = "lastModifiedOn";
}
