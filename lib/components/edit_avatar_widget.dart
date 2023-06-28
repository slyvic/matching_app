import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';

// ignore: must_be_immutable
class EditAvatarWidget extends StatelessWidget {
  final dynamic item;

  final ImagePicker imgpicker = ImagePicker();
  File? imagefile;
  openImages(source) async {
    try {
      var pickedFile = await imgpicker.pickImage(source: source);
      if (pickedFile != null) {
        final editedImage = await ImageCropper().cropImage(
            sourcePath: pickedFile.path,
            aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
            compressQuality: 80,
            maxWidth: 800,
            maxHeight: 800);
        if (editedImage != null) {}
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  EditAvatarWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 0.3,
        child: InkWell(
            child: item == ""
                ? GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 150,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        openImages(ImageSource.camera);
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: vw(context, 3),
                                              height: 10),
                                          const Image(
                                            image: AssetImage(
                                                "assets/images/identity/photo-camera-svgrepo-com.png"),
                                            height: 30,
                                          ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 30),
                                              child: Text("写真を撮る",
                                                  style:
                                                      TextStyle(fontSize: 17)))
                                        ],
                                      )),
                                  InkWell(
                                      onTap: () {
                                        openImages(ImageSource.gallery);
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: vw(context, 3),
                                              height: 10),
                                          const Image(
                                            image: AssetImage(
                                                "assets/images/identity/imagesmajor-svgrepo-com.png"),
                                            height: 30,
                                          ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 30),
                                              child: Text("写真を撮る",
                                                  style:
                                                      TextStyle(fontSize: 17)))
                                        ],
                                      )),
                                  const SizedBox(height: 1)
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: 110,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 190, 189, 198),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Column(children: [
                        Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/main/icons-tabbar-discover.png"),
                              width: 50,
                            )),
                        Text("写真2",
                            style: TextStyle(
                                fontSize: 11, color: PRIMARY_FONT_COLOR))
                      ]),
                    ))
                : Container(
                    width: 100,
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 190, 189, 198),
                        width: 1.0,
                      ),
                      color: PRIMARY_FONT_COLOR,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(item),
                        fit: BoxFit.cover,
                      ),
                    ))));
  }
}
