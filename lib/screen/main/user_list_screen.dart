import 'package:flutter/material.dart';
import 'package:matching_app/components/user_list_item.dart';
import 'package:matching_app/screen/main/layouts/user_list_header.dart';
import 'package:matching_app/utile/index.dart';

// ignore: use_key_in_widget_constructors
class UserListScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                delegate: UserListHeader((id){}), pinned: true),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
              return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: vww(context, vww(context, 1))),
                              child: Column(
                                children: [
                                  TextButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(EdgeInsets.zero),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/users_profile_screen');
                                    },
                                    child: const UserListItem(),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(EdgeInsets.zero),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/users_profile_screen');
                                    },
                                    child: const UserListItem(),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(EdgeInsets.zero),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/users_profile_screen');
                                    },
                                    child: const UserListItem(),
                                  ),
                                ],
                              )),
                        ]);
            }, childCount: 1)),
          ],
        ));
  }
}
