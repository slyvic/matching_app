import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/components/radius_button.dart';
import 'package:matching_app/components/Header.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class IdentityVerify extends StatefulWidget {
	@override
	// ignore: library_private_types_in_public_api
	_IdentityVerifyState createState() => _IdentityVerifyState();
}

class _IdentityVerifyState extends State<IdentityVerify> {
	
	final ImagePicker imgpicker = ImagePicker();
	File? imagefile;
	openImages(source) async {
		try {
			var pickedFile = await imgpicker.pickImage(source: source);
			if (pickedFile != null) {
				final editedImage = await ImageCropper().cropImage(
						sourcePath: pickedFile.path,
						aspectRatio: const CropAspectRatio(
								ratioX: 1, ratioY: 1),
						compressQuality:
								80,
						maxWidth: 800,
						maxHeight: 800);
				if (editedImage != null) {
					// ignore: use_build_context_synchronously
					Navigator.pushNamed(context, "/image_check", arguments: editedImage.path);
				}
			} else {
				print("No image is selected.");
			}
		} catch (e) {
			print("error while picking file.");
		}
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
				backgroundColor: Colors.white,
				body: Container(
						constraints: BoxConstraints(
							minHeight: vh(context, 90),
						),
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Padding(
									padding: EdgeInsets.only(top: vh(context, 2.5)),
									child: const HeaderWidget(title: "本人確認"),
								),
								Padding(
									padding: EdgeInsets.only(
											left: vw(context, 3),
											right: vw(context, 3),
											top: vh(context, 2)),
									child: Container(
										decoration: BoxDecoration(
											borderRadius: BorderRadius.circular(10.0),
											color: const Color.fromARGB(255, 0, 202, 157),
										),
										width: double.infinity,
										child: Padding(
												padding: EdgeInsets.only(top: vh(context, 2)),
												child: Column(children: [
													Text("お相手とメッセージをするためには",
															style:
																	TextStyle(color: Colors.white, fontSize: vhh(context, 2))),
													Text("本人確認が必要です",
															style:
																	TextStyle(color: Colors.white, fontSize: vhh(context, 4.5))),
													Padding(
														padding:
																EdgeInsets.symmetric(vertical: vh(context, 2)),
														child: Image(
																image: const AssetImage(
																		"assets/images/identity/idcard.png"),
																width: vw(context, 15.844),
																height: vw(context, 10)),
													),
												])),
									),
								),
								Padding(
										padding: EdgeInsets.symmetric(
												horizontal: vw(context, 3), vertical: vh(context, 2)),
										child: const Text(
											"メッセージ機能を利用するには、法律に基づき、公的証明書による、18歳以上の年齢確認が必要となります。",
											textAlign: TextAlign.center,
											style: TextStyle(
													fontSize: 13, color: PRIMARY_FONT_COLOR),
										)),
								Stack(children: [
									Padding(
										padding: EdgeInsets.only(
												left: vw(context, 3),
												right: vw(context, 3),
												top: vh(context, 5)),
										child: Container(
												decoration: BoxDecoration(
													borderRadius: BorderRadius.circular(10.0),
													color: const Color.fromARGB(255, 228, 249, 244),
												),
												width: double.infinity,
												child: Padding(
														padding: EdgeInsets.symmetric(
																vertical: vh(context, 5),
																horizontal: vw(context, 1)),
														child: Stack(
															children: [
																Container(
																	alignment: Alignment.center,
																	child: const Text(
																		"お客様情報は厳重に管理しております。\n" +
																				"ご提出いただいた証明書の画像は年齢確認にのみ使用し、それ以外の目的で使用しません。\n" +
																				"お預かりした情報は一定期間保管させていただいたのちに削除しております。",
																		style: TextStyle(
																				fontSize: 13,
																				color: PRIMARY_FONT_COLOR),
																	),
																),
															],
														))),
									),
									Padding(
											padding: EdgeInsets.only(top: vh(context, 2.5)),
											child: const Align(
												alignment: Alignment.topCenter,
												child: Image(
														image:
																AssetImage("assets/images/identity/lock.png")),
											))
								]),
								Expanded(
									child: Container(),
								),
								Padding(
										padding: EdgeInsets.symmetric(
												horizontal: getDeviceWidth(context) / 47 * 3),
										child: SizedBox(
												width: MediaQuery.of(context).size.width,
												child: Align(
													alignment: Alignment.center,
													child: RadiusButton(
														id: 0,
														color: BUTTON_MAIN,
														text: "確認に進む",
														goNavigation: (id) {
															showModalBottomSheet(
																	context: context,
																	shape: const RoundedRectangleBorder(
																		borderRadius: BorderRadius.vertical(
																			top: Radius.circular(25),
																		),
																	),
																	builder: (context) {
																		return Padding(
																			padding: EdgeInsets.only(
																					left: vw(context, 3),
																					right: vw(context, 3),
																					top: 20,
																					bottom: 40),
																			child: Column(
																				crossAxisAlignment:
																						CrossAxisAlignment.start,
																				mainAxisSize: MainAxisSize.min,
																				children: <Widget>[
																					Center(
																							child: Container(
																						width: vw(context, 20),
																						height: 5,
																						decoration: BoxDecoration(
																								borderRadius:
																										BorderRadius.circular(50.0),
																								color: PRIMARY_FONT_COLOR),
																					)),
																					Container(height: 20),
																					const Center(
																							child: Text(
																						"提出する書類を選択してください",
																						textAlign: TextAlign.center,
																						style: TextStyle(
																								fontSize: 15,
																								color: PRIMARY_FONT_COLOR),
																					)),
																					Container(height: 35),
																					ElevatedButton(
																							onPressed: () {
																								showModalBottomSheet(
																										context: context,
																										builder: (context) {
																											return SizedBox(
																												height: 150,
																												child: Column(
																													mainAxisAlignment: MainAxisAlignment.spaceAround,
																													children: [
																														InkWell(
																																onTap: () {
																																	openImages(ImageSource.camera);
																																},
																																child: Row(
																																	children: [
																																		SizedBox(
																																				width: vw(
																																						context,
																																						3),
																																				height:
																																						10),
																																		const Image(
																																			image: AssetImage(
																																					"assets/images/identity/photo-camera-svgrepo-com.png"),
																																			height:
																																					30,
																																		),
																																		const Padding(
																																				padding: EdgeInsets.only(
																																						left:
																																								30),
																																				child: Text(
																																						"写真を撮る",
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
																																				width: vw(
																																						context,
																																						3),
																																				height:
																																						10),
																																		const Image(
																																			image: AssetImage(
																																					"assets/images/identity/imagesmajor-svgrepo-com.png"),
																																			height:
																																					30,
																																		),
																																		const Padding(
																																				padding: EdgeInsets.only(
																																						left:
																																								30),
																																				child: Text(
																																						"写真を撮る",
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
																							style: ElevatedButton.styleFrom(
																									backgroundColor: BUTTON_MAIN,
																									shape: RoundedRectangleBorder(
																										borderRadius:
																												BorderRadius.circular(
																														10.0),
																									),
																									padding: const EdgeInsets
																													.symmetric(
																											horizontal: 10,
																											vertical: 10)),
																							child: Row(
																								children: [
																									const Image(
																										image: AssetImage(
																												"assets/images/identity/idcard.png"),
																										width: 65,
																									),
																									Expanded(child: Container()),
																									const Text("運転免許証",
																											style: TextStyle(
																													fontSize: 17,
																													color: Colors.white)),
																									Expanded(child: Container()),
																									Container(width: 65)
																								],
																							)),
																					Container(height: 20),
																					ElevatedButton(
																							onPressed: () {},
																							style: ElevatedButton.styleFrom(
																									backgroundColor: BUTTON_MAIN,
																									shape: RoundedRectangleBorder(
																										borderRadius:
																												BorderRadius.circular(
																														10.0),
																									),
																									padding: const EdgeInsets
																													.symmetric(
																											horizontal: 10,
																											vertical: 10)),
																							child: Row(
																								children: [
																									const Image(
																										image: AssetImage(
																												"assets/images/identity/driverlicense.png"),
																										width: 65,
																									),
																									Expanded(child: Container()),
																									const Text("マイナンバーカード",
																											style: TextStyle(
																													fontSize: 17,
																													color: Colors.white,
																													letterSpacing: -2)),
																									Expanded(child: Container()),
																									Container(width: 65)
																								],
																							))
																				],
																			),
																		);
																	});
														},
														isDisabled: false,
													),
												))),
								Padding(
										padding: EdgeInsets.symmetric(
												horizontal: getDeviceWidth(context) / 47 * 3),
										child: SizedBox(
												width: MediaQuery.of(context).size.width,
												child: InkWell(
														onTap: () {},
														child: Padding(
																padding: EdgeInsets.only(
																		top: vh(context, 2),
																		bottom: vh(context, 3)),
																child: const Text("後で登録する",
																		textAlign: TextAlign.center,
																		style: TextStyle(
																				fontSize: 17,
																				color: Color.fromARGB(
																						255, 0, 202, 157))))))),
							],
						)));
	}
}
