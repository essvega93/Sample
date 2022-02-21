import 'dart:io';

import 'package:flutter/material.dart';

import 'images_path.dart';

class ImageChooseWidget extends StatelessWidget {
  final Function()? selectImage;
  final bool isChooseVisible;
  final String? image;
  final String? backGroundIcon;
  final Widget? chooseIcon;
  final Color? iconBackColor;
  final double width;
  final double height;
  final double cameraRadius;
  final BoxDecoration? decoration;
  Widget? centerIconData;
  bool isFromNetwork;

  ImageChooseWidget({
    this.selectImage,
    this.chooseIcon,
    this.isFromNetwork = false,
    this.backGroundIcon,
    this.iconBackColor,
    this.width = 200,
    this.height = 200,
    this.centerIconData,
    this.cameraRadius = 20,
    this.decoration,
    this.isChooseVisible = true,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomRight, children: <Widget>[
      Container(
        decoration: decoration,
        width: width,
        height: height,
        child: InkWell(
          onTap: () {
            if (selectImage != null) {
              selectImage!();
            }
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            backgroundImage: getImage(image),
          ),
        ),
      ),
      Visibility(
        visible: isChooseVisible,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(cameraRadius)),
          ),
          child: InkWell(
            onTap: () {
              if (selectImage != null) {
                selectImage!();
              }
            },
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            child: chooseIcon ??
                const Icon(
                  Icons.image,
                  color: Colors.black,
                  size: 20,
                ),
          ),
        ),
      )
    ]);
  }

  getImage(String? image) {
    return image == null
        ? const AssetImage(ImagePath.USER_PLACE_HOLDER)
        : isFromNetwork
            ? NetworkImage(image)
            : FileImage(File(image));
  }
}
