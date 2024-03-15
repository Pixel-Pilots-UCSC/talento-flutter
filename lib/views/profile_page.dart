import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talento/utils/custom_icons.dart';
import 'package:talento/views/aboutme.dart';

import 'package:talento/views/qualification.dart';
import 'package:talento/views/skill.dart';
import 'package:talento/views/work.dart';

import 'package:talento/models/user_model.dart';
import 'package:talento/widgets/app_drawer.dart';
import '../constant.dart';
import 'package:talento/widgets/profile_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ProfilePage({super.key});

  getProfileData() async {
    //get profile data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString('user');
    UserModel user = UserModel.fromJson(jsonDecode(userString!));
    print('user data');
    print(user.data);

    return user;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          key: _scaffoldKey,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: <Widget>[
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(CustomIcons.push),
                      color: Colors.black,
                      onPressed: () {
                        // do something
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings_outlined),
                      color: Colors.black,
                      onPressed: () {
                        // do something
                      },
                    ),
                  ],
                )
              ],
              leading: Builder(builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.black,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              })),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: getProfileData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          UserModel user = snapshot.data;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const SizedBox(height: 20),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.fromBorderSide(
                                    BorderSide(
                                      color: Colors.black,
                                      width: .5,
                                    ),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(user.data!.image!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(user.data!.profile!.name!,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.resolveWith(
                                          (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.disabled)) {
                                          return RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          );
                                        }
                                        return RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        );
                                      }),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF3EB489)),
                                    ),
                                    onPressed: () {},
                                    child: const Row(
                                      children: [
                                        Text(
                                          'Edit Details',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(Icons.edit_outlined,
                                            color: Colors.white),
                                      ],
                                    ),
                                  )),
                            ],
                          );
                        } else {
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    
                    width: MediaQuery.of(context).size.width,
                    child: FutureBuilder(
                      future: getProfileData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          UserModel user = snapshot.data;
                          return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 20),
                          ProfileList(
                            title: 'About me',
                            bgColor: Colors.blue,
                            iconColor: Color(0xFF3EB489),
                            icon: Icons.person_outline,
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return AboutMe(userId: user.data!.sId!);
                              }));
                              // ignore: unnecessary_brace_in_string_interps
                              print("id:${user.data!.sId!}");
                            },
                          ),
                          const SizedBox(height: 20),
                          ProfileList(
                            title: 'work experience',
                            bgColor: Colors.red,
                            iconColor: Color(0xFF3EB489),
                            icon: Icons.shopping_bag_outlined,
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return WorkEx();
                              }));
                            },
                          ),
                          const SizedBox(height: 20),
                          ProfileList(
                            title: 'Education',
                            bgColor: Colors.orange,
                            iconColor: Color(0xFF3EB489),
                            icon: Icons.school_outlined,
                            onTap: () {
                              // Navigator.of(context)
                              //     .push(MaterialPageRoute(builder: (_) {
                              //   return Education();
                              // }));
                            },
                          ),
                          const SizedBox(height: 20),
                          ProfileList(
                            title: 'Skill',
                            bgColor: Colors.purple,
                            iconColor: Color(0xFF3EB489),
                            icon: Icons.grade_outlined,
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return Skills();
                              }));
                            },
                          ),
                          const SizedBox(height: 20),
                          ProfileList(
                            title: 'Qualifications',
                            bgColor: Colors.grey,
                            iconColor: Color(0xFF3EB489),
                            icon: Icons.verified_user_outlined,
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                  return Qualification(userId: user.data!.sId ?? '');
                              }));
                              print("id:${user.data!.sId!}");
                            },
                          ),
                        ],
                        
                      );
                        
                        }
                      else {
                          return CircularProgressIndicator();
                        }
                      },
                      )

                  ),
                ],
              ),
            ),
          ),
          drawer: AppDrawer(scaffoldKey: _scaffoldKey, selectedIndex: 0)),
    );
  }
}
