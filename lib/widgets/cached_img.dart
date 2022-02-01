import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImg extends StatelessWidget {
  const CachedImg({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.shape,
  }) : super(key: key);
  //
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxShape? shape;
  //
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width ?? 40.0,
      height: height ?? 40.0,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
