import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

// ignore: must_be_immutable
class ImageZoomScreen extends StatelessWidget {
  String img;

  ImageZoomScreen({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PhotoViewGallery.builder(
        itemCount: 1,
        builder: (context, index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(img),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        pageController: PageController(),
        scrollPhysics: const BouncingScrollPhysics(),
        // backgroundDecoration: BoxDecoration(
        //   color: Colors.black,
        // ),

        // pageController: PageController(),
        // scrollPhysics: BouncingScrollPhysics(),
      ),
    );
  }
}
