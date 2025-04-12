class EndPoint {
  //! user authentication End Point
  static String baseUrl = "https://carcareapp.runasp.net/api/";
  //User and technical end points
  static String acount = "account/";
  static String login = "${acount}login";
  static String registerUser = "${acount}register/user";
  static String registerTechnical = "${acount}register/Technical";
  static String getCurrentUser = "${acount}GetCurrentUser";
  static String getCurrentTechnical = "${acount}GetCurrentTechnical";
  static String changePassword = "${acount}Change-Password";
  static String getRefreshToken = "${acount}Get-Refresh-Token";
  static String revokeRefreshToken = "${acount}Revoke-Refresh-Token";
  static String forgetPasswordEmail = "${acount}ForgetPasswordEmail";
  static String verfiyCodeEmail = "${acount}VerfiyCodeEmail";
  static String resetPassword = "${acount}ResetPasswordEmail";
  static String confirmationCodeEmail = "${acount}ConfirmationCodeEmail";
  static String confirmEmail = "${acount}ConfirmEmail";
  static String updateUser = "${acount}UpdateUser";
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

        static String feadback = "FeedBack/";
  static String creatFeadback = "${feadback}CreateFeedBack";
  static String getFeedBack = "${feadback}GetFeedBack/";
  static String getappFeedBack = "${feadback}GetAvarageRating";

  static String updateFeedBack = "${feadback}UpdateFeedBack/";
  static String serviceReuest = "ServiceRequest/";
  static String getAllPendingRequestsToTechnical = "${serviceReuest}GetAllPendingRequestsToTechnical";
   static String getAllOrders = "${serviceReuest}GetAllRequestsToTechnical";
  static String techincalBeActive = "${serviceReuest}TechincalBeActive";
  static String techincalBeInActive = "${serviceReuest}TechincalBeInActive";
  static String acceptRequest = "${serviceReuest}AcceptRequest/";
  static String rejectRequest = "${serviceReuest}RejectRequest/";
  static String completeRequest = "${serviceReuest}CompleteRequest/";
  static String getcomplateOrder = "${serviceReuest}GetAllRequestsToTechnical?status=2";
  static String getTecnicalPrfile = "Account/GetCurrentUserByRole";
  static String udateProfile = "account/UpdateTech";

  

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
  static String rating = "rating";
  static String comment = "comment";
  static String orderId = "id";
  static String techId = "techId";
  static String techName = "techName";
  static String techJop = "techJop";
  static String distance = "distance";
  static String serviceTypeId = "serviceTypeId";
  static String bettaryType = "bettaryType";
  static String typeOfFuel = "typeOfFuel";
  static String typeOfOil = "typeOfOil";
  static String tireSize = "tireSize";
  static String typeOfWinch = "typeOfWinch";
  static String serviceQuantity = "serviceQuantity";
  static String servicePrice = "servicePrice";
  static String userIdorder = "userId";
  static String userName = "userName";
  static String userLatitude = "userLatitude";
  static String userLongitude = "userLongitude";
  static String busnissStatus = "busnissStatus";
  static String paymentStatus = "paymentStatus";
  static String createdBy = "createdBy";
  static String createdOn = "createdOn";
  static String paymentIntentId = "paymentIntentId";
  static String clientSecret = "clientSecret";
   static String nationalIdTecnical = "nationalId";
  static String serviceNameTecnical= "serviceName";
   static String  techLatitude  = "techLatitude";
  static String   profit = "profit";
  static String   techLongitude = "techLongitude";
    static String techRate = "techRate";
   static String  completedRequestes= "completedRequestes";
  static String   idTecnical =  "id";
  static String   fullNameTecnical = "fullName";
    static String phoneNumberTecnical = "phoneNumber";
   static String  emailTecnical = "email";
  static String   typeTecnical = 'type';
    static String tokenTecnical = 'token';
    static String refreshTokenTecnical = 'refreshToken';
   static String  refreshTokenExpirationDateTecnical = 'refreshTokenExpirationDate';
   static String  fullNameUpdate = 'FullName';
   static String  phoneNumberUpdate = 'phoneNumber';
   static String  emailUpdate = 'email';
   static String  idUpdate = 'nationalId';
   static String  teccniclSwitch = 'teccniclSwitch';
     static String feadbackid = "feadbackid";
}
