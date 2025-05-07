import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:screenutil_module/main.dart';
import 'package:splash_app/core/helper/cache_helper.dart';
import 'app.dart';

void main() async {
   await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper().init();
  //final localAuthService = LocalAuthService();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const CarCareApp(),
    ),
  );
}

 









// import 'dart:async';
// import 'dart:io';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Car Plate Detection',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: ImageUploadScreen(),
//     );
//   }
// }

// class ImageUploadScreen extends StatefulWidget {
//   @override
//   _ImageUploadScreenState createState() => _ImageUploadScreenState();
// }

// class _ImageUploadScreenState extends State<ImageUploadScreen> {
//   File? _imageFile;
//   bool _isLoading = false;
//   Map<String, dynamic>? _responseData;
//   String _connectionStatus = 'Ready to connect';
//   final String _serverIp = '192.168.1.8'; // <-- Replace with your Flask server IP
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage(ImageSource source) async {
//     try {
//       final XFile? pickedFile = await _picker.pickImage(source: source);
//       if (pickedFile != null) {
//         setState(() {
//           _imageFile = File(pickedFile.path);
//           _connectionStatus = 'Image selected';
//         });
//       } else {
//         setState(() {
//           _connectionStatus = 'No image selected';
//         });
//       }
//     } catch (e) {
//       setState(() {
//         _connectionStatus = 'Image selection error: $e';
//       });
//     }
//   }

//   Future<void> _uploadImage() async {
//     if (_imageFile == null) return;

//     setState(() {
//       _isLoading = true;
//       _responseData = null;
//       _connectionStatus = 'Connecting to $_serverIp...';
//     });

//     try {
//       final apiUrl = 'http://$_serverIp:5000/predict';
//       print('Attempting to connect to: $apiUrl');

//       var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
//       request.files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));

//       var response = await request.send().timeout(const Duration(seconds: 15));
//       var responseBody = await response.stream.bytesToString();
//       print('Raw response: $responseBody');

//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(responseBody) as Map<String, dynamic>;
//         if (jsonResponse.containsKey('car_brand') &&
//             jsonResponse.containsKey('car_color') &&
//             jsonResponse.containsKey('car_plate')) {
//           setState(() {
//             _responseData = jsonResponse;
//             _connectionStatus = 'Connected successfully!';
//           });
//         } else {
//           throw Exception('Invalid response format');
//         }
//       } else {
//         throw Exception('Server error: ${response.statusCode}');
//       }
//     } on SocketException {
//       setState(() {
//         _connectionStatus = 'Network error: Check connection';
//       });
//     } on TimeoutException {
//       setState(() {
//         _connectionStatus = 'Timeout: Server not responding';
//       });
//     } catch (e) {
//       setState(() {
//         _connectionStatus = 'Error: ${e.toString()}';
//       });
//       print('Error details: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Car Plate Detection')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Connection status
//             Card(
//               color: _isLoading
//                   ? Colors.blue[100]
//                   : (_responseData != null ? Colors.green[100] : Colors.grey[100]),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Row(
//                   children: [
//                     Icon(
//                       _isLoading
//                           ? Icons.sync
//                           : (_responseData != null ? Icons.check_circle : Icons.error),
//                       color: _isLoading
//                           ? Colors.blue
//                           : (_responseData != null ? Colors.green : Colors.red),
//                     ),
//                     SizedBox(width: 10),
//                     Expanded(child: Text(_connectionStatus)),
//                     if (_isLoading) CircularProgressIndicator(),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),

//             // Image preview
//             Container(
//               height: 200,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: _imageFile != null
//                   ? Image.file(_imageFile!, fit: BoxFit.contain)
//                   : Center(child: Text('No image selected')),
//             ),
//             SizedBox(height: 20),

//             // Buttons to pick image
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () => _pickImage(ImageSource.gallery),
//                   icon: Icon(Icons.photo),
//                   label: Text('Gallery'),
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () => _pickImage(ImageSource.camera),
//                   icon: Icon(Icons.camera_alt),
//                   label: Text('Camera'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),

//             // Upload button
//             ElevatedButton(
//               onPressed: _imageFile != null && !_isLoading ? _uploadImage : null,
//               child: _isLoading
//                   ? CircularProgressIndicator(color: Colors.white)
//                   : Text('Test API Connection'),
//             ),
//             SizedBox(height: 20),

//             // Results display
//             if (_responseData != null)
//               Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Detection Results:',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       SizedBox(height: 10),
//                       Text('Brand: ${_responseData!['car_brand'] ?? 'N/A'}'),
//                       Text('Color: ${_responseData!['car_color'] ?? 'N/A'}'),
//                       Text('Plate: ${_responseData!['car_plate'] ?? 'N/A'}'),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
