import 'package:photo_view/photo_view.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const images = [
      'assets/images/one.png',
      'assets/images/two.png',
      'assets/images/three.png'
    ];
    return Scaffold(
      body: Center(
        child: PhotoViewGallery.builder(
          itemCount: images.length,
          builder: (ctx, index){
            return PhotoViewGalleryPageOptions(imageProvider: AssetImage(images[index]));
          },
        ),
      ),
    );
  }
}
