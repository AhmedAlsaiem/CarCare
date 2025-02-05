
String correctServiceImageUrl({required String imageUrl}) {
  String baseUrl = "https://carcareapp.runasp.net/";

  String url = baseUrl + imageUrl.substring(23);
  return url;
}
