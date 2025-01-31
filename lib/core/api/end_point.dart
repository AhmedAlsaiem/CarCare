class EndPoint {
  //! user authentication End Point
  static String baseUrl = "https://carcareapp.runasp.net/api/";
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

  static String getUserDataEndPoint(id) {
    return "user/get-user/$id";
  }
}

class ApiKey {
  static String status = "status";
  static String statusCode = "statusCode";
  static String refreshTokenExpirationDate = "refreshTokenExpirationDate";
  static String refreshToken = "refreshToken";
  static String phoneNumber = "phoneNumber";
    static String resetCode = "resetCode";

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
}
