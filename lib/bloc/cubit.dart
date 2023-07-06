import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_app/common.dart';
import 'package:http/http.dart' as http;
part 'state.dart';

class AppCubit extends Cubit<AppState> {
	// !--------> register start
	String nickName = "";
	bool isValidNickName = false;
	String bDay = "";
	List<AddressObject> addressList = <AddressObject>[];
	List<CommunityObject> communityList = <CommunityObject>[];
	double height = 130;
	List<BodyTypeObject> bodyTypeList = <BodyTypeObject>[];
	int bodyType = -1;
	List<BodyTypeObject> purposeList = <BodyTypeObject>[];
	int purpose = -1;
	List<BadgeItemObject> badgeList = <BadgeItemObject>[];
	List<BadgeItemObject> selectedBadgeList = [];
	String avatarImage = "";

	AppCubit() : super(AppInitial());

	void changeNickName (String value) {
		nickName = value;
		emit(AppRegister());
	}
	
	Future<void> validationNickName (String value) async {
		try {
			final response = await http.get(Uri.parse('${API_URL}nickname_validation?nickname=$value'));
				// print(response.body);
			if (response.statusCode == 200) {
				Map<String, dynamic> jsonData = jsonDecode(response.body);
				print(jsonData['result']);
				isValidNickName = jsonData['result'];
			} else {
				print("Url Not Found!");
				isValidNickName = false;
			}
		} catch (e) {
				print("Error---------->${e}");
				isValidNickName = false;
		}
		emit(AppRegister());
	}
	
	void changeBDay (String value) {
		bDay = value;
		emit(AppRegister());
	}

	void changeHeight (double value) {
		height = value;
		emit(AppRegister());
	}

	Future<void> fetchAddressList () async {
		try {
			final response = await http.get(Uri.parse('${API_URL}get_residence'));
				// print(response.body);
			if (response.statusCode == 200) {
				Map<String, dynamic> jsonAddressList = jsonDecode(response.body);
				addressList.clear();
				for (var i = 0; i < jsonAddressList['data'].length; i++) {
					addressList.add(AddressObject(jsonAddressList['data'][i]['id'], jsonAddressList['data'][i]['residence'], false));
				}
				emit(AppRegister());
			} else {
				print("Url Not Found!");
			}
		} catch (e) {
				print("Error---------->${e}");
		}
	}

	Future<void> fetchCommunityList () async {
		try {
			final response = await http.get(Uri.parse('${API_URL}get_community'));
			if (response.statusCode == 200) {
				Map<String, dynamic> jsonAddressList = jsonDecode(response.body);
				communityList.clear();
				for (var i = 0; i < jsonAddressList['data'].length; i++) {
					communityList.add(CommunityObject(jsonAddressList['data'][i]['idx'], jsonAddressList['data'][i]['label'], false, jsonAddressList['data'][i]['category'], jsonAddressList['data'][i]['parent'], "$BASE_URL/uploads/${jsonAddressList['data'][i]['image']}"));
				}
				emit(AppRegister());
			} else {
				print("Url Not Found!");
			}
		} catch (e) {
				print("Error---------->${e}");
		}
	}

	Future<void> fetchBodyTypeList () async {
		try {
			final response = await http.get(Uri.parse('${API_URL}get_bodytype'));
			if (response.statusCode == 200) {
				bodyTypeList.clear();
				Map<String, dynamic> list = jsonDecode(response.body);
				for (var i = 0; i < list['data'].length; i++) {
					bodyTypeList.add(BodyTypeObject(list['data'][i]['id'], list['data'][i]['type_name']));
				}
				emit(AppRegister());
			} else {
				print("Url Not Found!");
			}
		} catch (e) {
				print("Error---------->${e}");
		}
	}

	void changeBodyType (int idx) {
		bodyType = idx;
		emit(AppRegister());
	}

	Future<void> fetchPurposeList () async {
		try {
			final response = await http.get(Uri.parse('${API_URL}get_usepurpose'));
			if (response.statusCode == 200) {
				purposeList.clear();
				Map<String, dynamic> list = jsonDecode(response.body);
				for (var i = 0; i < list['data'].length; i++) {
					purposeList.add(BodyTypeObject(list['data'][i]['id'], list['data'][i]['use_purpose']));
				}
				emit(AppRegister());
			} else {
				print("Url Not Found!");
			}
		} catch (e) {
				print("Error---------->${e}");
		}
	}

	void changePurpose (int idx) {
		purpose = idx;
		emit(AppRegister());
	}

	Future<void> fetchBadgeList () async {
		try {
			final response = await http.get(Uri.parse('${API_URL}get_introbadge'));
			if (response.statusCode == 200) {
				selectedBadgeList.clear();
				badgeList.clear();
				Map<String, dynamic> list = jsonDecode(response.body);
				for (var i = 0; i < list['data'].length; i++) {
					if (i != 0 && list['data'][i - 1]['tag_color'] != list['data'][i]['tag_color']) {
						badgeList.add(BadgeItemObject(-1, list['data'][i]['tag_text'], false, list['data'][i]['tag_color']));
					}
					badgeList.add(BadgeItemObject(list['data'][i]['id'], list['data'][i]['tag_text'], false, list['data'][i]['tag_color']));
				}
				emit(AppRegister());
			} else {
				print("Url Not Found!");
			}
		} catch (e) {
				print("Error---------->${e}");
		}
	}

	void changeBadge (int idx) {
		if (!badgeList.elementAt(idx).isChecked) {
      selectedBadgeList.add(badgeList.elementAt(idx));
		print(selectedBadgeList.length);
      if (selectedBadgeList.length > 5) {
				badgeList
						.where((element) => element.id == selectedBadgeList.elementAt(0).id)
						.first
						.isChecked = false;
        selectedBadgeList.removeAt(0);
      }
    } else {
      selectedBadgeList.remove(badgeList.elementAt(idx));
    }
    badgeList.elementAt(idx).isChecked = !badgeList.elementAt(idx).isChecked;
		emit(AppRegister());
	}

	void changeAvatar (String uri) {
		avatarImage = uri;
		emit(AppRegister());
	}

	Future<int> uploadProfile() async {
		String selectedCommunityList = "";
		for (var i = 0; i < communityList.length; i++) {
			if (communityList[i].isChecked) {
				print(communityList[i].idx);
				selectedCommunityList += "${communityList[i].idx},";
			}
		}
		String selectedBadges = "";
		for (var i = 0; i < selectedBadgeList.length; i++) {
				selectedBadges += "${selectedBadgeList[i].id},";
		}
		print("user_nickname$nickName");
		print("birthday$bDay");
		print("address${addressList.where((element) => element.isChecked).first.idx}");
		print("community$selectedCommunityList");
		print(height);
		print(bodyType);
		print(purpose);
		print(selectedBadges);
		print(avatarImage);
		var request = http.MultipartRequest('POST', Uri.parse('${API_URL}register_action'));
		request.fields['edtNickName'] = nickName;
		request.fields['edtBirthday'] = bDay;
		request.fields['edtAddress'] = addressList.where((element) => element.isChecked).first.idx.toString();
		request.fields['edtCommunity'] = selectedCommunityList;
		request.fields['edtHeight'] = height.toString();
		request.fields['edtBodyType'] = bodyType.toString();
		request.fields['edtUsePurpose'] = purpose.toString();
		request.fields['edtIntroBadge'] = selectedBadges;
		var imageFile = File(avatarImage);
		var imageStream = http.ByteStream(imageFile.openRead());
		var imageLength = await imageFile.length();

		var multipartFile = http.MultipartFile('image', imageStream, imageLength, filename: imageFile.path);
		request.files.add(multipartFile);
		var response = await request.send();
		if (response.statusCode == 200) {
			var responseData = await response.stream.bytesToString(); // Convert response stream to string
			var decodedData = json.decode(responseData);
			print(decodedData);
			return 1;
		} else {
			print(response.statusCode);
			return 0;
		}
	}

	// !--------> register end

	static AppCubit get(context) => BlocProvider.of(context);
}
