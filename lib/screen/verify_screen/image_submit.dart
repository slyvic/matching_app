import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// import 'package:flutter_redux/flutter_redux.dart';
// ignore: use_key_in_widget_constructors
class ImageSubmit extends StatefulWidget {
	@override
	// ignore: library_private_types_in_public_api
	_ImageSubmitState createState() => _ImageSubmitState();
}

class _ImageSubmitState extends State<ImageSubmit> {
	File? imagefile;

	@override
	Widget build(BuildContext context) {
		Object? imagePath = ModalRoute.of(context)!.settings.arguments;
		imagefile = File(imagePath.toString());
		return Scaffold(
				backgroundColor: Colors.white,
				body: Container(
						constraints: BoxConstraints(
							minHeight: vh(context, 90), // Set the minimum height here
						),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								const Padding(
									padding: EdgeInsets.only(top: 15, bottom: 60),
									child: HeaderWidget(title: "本人確認"),
								),
								Center(
										child: Padding(
												padding: EdgeInsets.symmetric(
														horizontal: vw(context, 10),),
														child: SizedBox(
																height: vh(context, 20),
																width: double.infinity,
																child: const Image(
																		image: AssetImage(
																				"assets/images/identity/time.png"),
																		fit: BoxFit.contain)))),
								Center(
									child: Padding(
											padding: EdgeInsets.symmetric(
													horizontal: vw(context, 4),
													vertical: vh(
														context, 3
													)),
											child: const Text(
													"ご提出いただいた公的書類を確認しております通常1〜2日営業日以内に審査は完了します",
													style: TextStyle(fontSize: 13),
													textAlign: TextAlign.center)),
								),
								Expanded(
									child: Container(),
								),
								Padding(
										padding: EdgeInsets.symmetric(
												vertical: vh(context, 5),
												horizontal: getDeviceWidth(context) / 47 * 3),
										child: SizedBox(
												width: MediaQuery.of(context).size.width,
												child: Align(
													alignment: Alignment.center,
													child: RadiusButton(
														id: 0,
														color: BUTTON_MAIN,
														text: "戻る",
														goNavigation: (id) {
															Navigator.pushNamed(context, "/profile_screen", arguments: true);
														},
														isDisabled: false,
													),
												))),
							],
						)));
	}
}
