import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_app/common.dart';
import 'package:http/http.dart' as http;
part 'state.dart';

class AppCubit extends Cubit<AppState> {

  String nickName = "";
  String bDay = "";
  List<AddressObject> addressList = <AddressObject>[];
  
  AppCubit() : super(AppInitial());

  void changeNickName (String value) {
    nickName = value;
    emit(AppNickName());
  }
  void changeBDay () {
    // addressList
    emit(AppBDay());
  }

  Future<void> fetchiAddressList () async {
    try {
      final response = await http.get(Uri.parse('${API_URL}get_residence'));
        // print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonAddressList = jsonDecode(response.body);
        for (var i = 0; i < jsonAddressList['data'].length; i++) {
          print(jsonAddressList['data'][i]);
          addressList.add(AddressObject(jsonAddressList['data'][i]['id'], jsonAddressList['data'][i]['residence'], false));
        }
        emit(AppAddressList());
      } else {
        print("Url Not Found!");
      }
    } catch (e) {
        print("Error---------->${e}");
    }
  }

  static AppCubit get(context) => BlocProvider.of(context);
}
