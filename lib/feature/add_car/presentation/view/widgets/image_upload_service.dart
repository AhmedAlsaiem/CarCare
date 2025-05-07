import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageUploadService {
  final String serverIp;

  ImageUploadService({required this.serverIp});

  Future<Map<String, dynamic>> uploadImage(File imageFile) async {
    final apiUrl = 'http://$serverIp:5000/predict';

    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    var response = await request.send().timeout(const Duration(seconds: 15));
    var responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(responseBody) as Map<String, dynamic>;
      if (jsonResponse.containsKey('car_brand') &&
          jsonResponse.containsKey('car_color') &&
          jsonResponse.containsKey('car_plate')) {
        return jsonResponse;
      } else {
        throw Exception('Invalid response format');
      }
    } else {
      throw Exception('Server error: ${response.statusCode}');
    }
  }
}