import 'dart:io';

import 'package:fetching_data/manager/navigator_manager.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewManager {
  static void viewPhotoFile(File image, BuildContext context) {
    NavigatorManager.push(
        context,
        (context) => PhotoView(
            imageProvider: FileImage(image),
            minScale: PhotoViewComputedScale.contained));
  }

  static void viewPhotoUrl(String url, BuildContext context) {
    NavigatorManager.push(
        context,
        (context) => PhotoView(
            imageProvider: NetworkImage(url),
            minScale: PhotoViewComputedScale.contained));
  }
}
