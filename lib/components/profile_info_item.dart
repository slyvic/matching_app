import 'package:flutter/material.dart';
import 'package:matching_app/common.dart';
import 'package:matching_app/utile/index.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

typedef OnPressed = void Function(bool state);


class ProfileInfoItem extends StatelessWidget {
	final String title, value;

	final bool isShowWheel;
	final OnPressed onPressed;

	const ProfileInfoItem(
			{super.key,
			required this.title,
			required this.value,
			required this.isShowWheel, required this.onPressed});

	@override
	Widget build(BuildContext context) {
		return Container(
				decoration: const BoxDecoration(
					border: Border(
						bottom: BorderSide(
							color: Color.fromARGB(255, 237, 237, 237),
							width: 2.0,
						),
					),
				),
				padding: const EdgeInsets.only(top: 5, bottom: 5),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
						Padding(
								padding: const EdgeInsets.only(bottom: 7, top: 7),
								child: Row(
									children: [
										Expanded(
											flex: 3,
											child: Text(
												title,
												style: const TextStyle(
														fontSize: 14, color: PRIMARY_FONT_COLOR),
											),
										),
										Expanded(
											flex: 2,
											child: GestureDetector(
													onTap: () {
														onPressed(!isShowWheel);
													},
													child: value != ""
															? Text(
																	value,
																	style: const TextStyle(
																			fontSize: 14,
																			color:
																					Color.fromARGB(255, 155, 155, 155)),
																)
															: const Text(
																	"未設定",
																	style: TextStyle(
																			fontSize: 14, color: BUTTON_MAIN),
																)),
										),
									],
								)),
						isShowWheel == true
								? SizedBox(
										height: 150,
										width: vww(context, 100),
										child: WheelChooser.custom(
											onValueChanged: (a) => print(a),
											children: const <Widget>[
												Text("data1"),
												Text("data2"),
												Text("data3"),
												Text("data4"),
												Text("data5"),
												Text("data6"),
											],
										),
									)
								: Container()
					],
				));
	}
}
