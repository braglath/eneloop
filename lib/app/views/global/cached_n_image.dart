import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/resources/color_resources.dart';

class CachedNImage extends StatefulWidget {
  final String imagefromNetwork;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? initial;
  final bool isProfile;

  const CachedNImage(
      {Key? key,
      this.initial,
      required this.imagefromNetwork,
      this.width,
      this.height,
      this.isProfile = false,
      required this.fit})
      : super(key: key);

  @override
  State<CachedNImage> createState() => _CachedNImageState();
}

class _CachedNImageState extends State<CachedNImage> {
  final ValueNotifier<int> _networklHasErrorNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      httpHeaders: const {
        "Access-Control-Allow-Headers": "Access-Control-Allow-Origin, Accept"
      },
      placeholderFadeInDuration: 500.milliseconds,
      width: widget.width,
      height: widget.height,
      // memCacheWidth: 270,
      // memCacheHeight: 270,
      maxHeightDiskCache: 800,
      maxWidthDiskCache: 800,
      fit: widget.fit,
      imageUrl: widget.imagefromNetwork,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: widget.fit,
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const Center(
              child: CircularProgressIndicator(
        color: APP_MID_GREEN,
      )),
      errorWidget: (context, url, error) => GestureDetector(
          onTap: () {
            _networklHasErrorNotifier.value++;
            setState(() {});
          },
          child: Icon(widget.isProfile
              ? Icons.person
              : Icons.image_not_supported_rounded)),
    );
  }
}
