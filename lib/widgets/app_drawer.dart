import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:talento/models/auth_user.dart';
import 'package:talento/models/user_model.dart';

import '../constant.dart';

//prefered size widget for the app drawer
class AppDrawer extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  int selectedIndex = 0;

  AppDrawer({super.key, required this.scaffoldKey, required this.selectedIndex});


  getProfileData() async {
    //get profile data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString('user');
    UserModel user = UserModel.fromJson(jsonDecode(userString!));
    print(user);

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF3EB489),
            ),
            child: FutureBuilder(
              future: getProfileData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user.data!.image!),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        user.data!.profile!.name!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        user.data!.email!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Skeletonizer(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://i.ytimg.com/vi/o4_m_RKmv5U/maxresdefault.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15.0,
                              child: Icon(
                                Icons.camera_alt,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },

            ),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(
                  Icons.home,
                  color: selectedIndex == 0
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.onBackground,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    color: selectedIndex == 0
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).colorScheme.onBackground,
                  ),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
