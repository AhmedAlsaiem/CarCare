import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/image_picker_widget.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/image_upload_service.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/result_diplay_widget.dart';
import 'package:splash_app/feature/add_car/presentation/view/widgets/status_inductor_widget.dart';




class InfoByMachine extends StatefulWidget {
  final Function(Map<String, dynamic>)? onDetectionComplete;

  const InfoByMachine({Key? key, this.onDetectionComplete}) : super(key: key);
  
  @override
  // ignore: library_private_types_in_public_api
  _InfoByMachineState createState() => _InfoByMachineState();
}

class _InfoByMachineState extends State<InfoByMachine> {
  File? _imageFile;
  bool _isLoading = false;
  Map<String, dynamic>? _responseData;
  String _connectionStatus = 'Ready to connect';
  final ImageUploadService _uploadService = ImageUploadService(
    serverIp: '192.168.1.8', // Or use dependency injection
  );

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);
      
      setState(() {
        _imageFile = pickedFile != null ? File(pickedFile.path) : null;
        _connectionStatus = pickedFile != null 
            ? 'Image selected' 
            : 'No image selected';
        _responseData = null;
      });
    } catch (e) {
      setState(() {
        _connectionStatus = 'Image selection error: $e';
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    setState(() {
      _isLoading = true;
      _responseData = null;
      _connectionStatus = 'Connecting to server...';
    });

    try {
      final response = await _uploadService.uploadImage(_imageFile!);
      
      setState(() {
        _responseData = response;
        _connectionStatus = 'Connected successfully!';
      });
      
      widget.onDetectionComplete?.call(response);
    } on SocketException {
      setState(() {
        _connectionStatus = 'Network error: Check connection';
      });
    } on TimeoutException {
      setState(() {
        _connectionStatus = 'Timeout: Server not responding';
      });
    } catch (e) {
      setState(() {
        _connectionStatus = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: const Text('Car Plate Detection')),
     //appBar: customMyCarAppBar(title: 'scanner info'), 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
        const      SizedBox(height: 20,),
              StatusIndicatorWidget(
                isLoading: _isLoading,
                hasResponse: _responseData != null,
                status: _connectionStatus,
              ),
              const SizedBox(height: 20),
              
              ImagePickerWidget(
                onPickImage: _pickImage,
                imageFile: _imageFile,
              ),
              const SizedBox(height: 10),
              
              ElevatedButton(
                onPressed: _imageFile != null && !_isLoading ? _uploadImage : null,
                child: _isLoading
                    ? const CircularProgressIndicator(color: ColorsManager.mainColor)
                    : const Text('Get Data' , style: TextStyle(color: ColorsManager.mainColor)),
              ),
              const SizedBox(height: 20),
              
              if (_responseData != null)
                ResultsDisplayWidget(responseData: _responseData!),
            ],
          ),
        ),
      ),
    );
  }
}