import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../assets/icons/app_icons.dart' show CustomIcons;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File _image;
  final _picker = ImagePicker();

  void _galleryImage() async {
    final image = await _picker.getImage(source: ImageSource.gallery);

    _setState(image);
  }

  void _cameraImage() async {
    final image = await _picker.getImage(source: ImageSource.camera);

    _setState(image);
  }

  void _setState(image) {
    setState(() {
      if (image != null) {
        _image = File(image.path);
      }
    });
  }

  ImageProvider<Object> _showImage() {
    if (_image != null) {
      return FileImage(_image);
    } else {
      return AssetImage('lib/assets/icons/app/android.png');
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
            child: Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('open camera'),
                onTap: () {
                  _cameraImage();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                ),
                title: Text('open gallery'),
                onTap: () {
                  _galleryImage();
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: _showImage(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 44,
        ),
      ),
      floatingActionButton: Container(
        height: 54,
        width: 54,
        child: FloatingActionButton(
          onPressed: () {
            _showPicker(context);
          },
          child: Icon(CustomIcons.gallery),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
