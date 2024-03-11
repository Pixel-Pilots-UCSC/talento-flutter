import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:talento/utils/custom_icons.dart';
import 'package:talento/views/aboutme.dart';
import 'package:talento/views/education.dart';
import 'package:talento/views/qualification.dart';
import 'package:talento/views/skill.dart';
import 'package:talento/views/work.dart';

import 'package:talento/widgets/profile_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.black,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              }
            )),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: Colors.black,
                              width: .5,
                            ),
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text('John Doe',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.resolveWith(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  );
                                }
                                return RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                );
                              }),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.green),
                            ),
                            onPressed: () {},
                            child: const Row(
                              children: [
                                Text(
                                  'Edit Details',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.edit_outlined, color: Colors.white),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20),
                      ProfileList(
                        title: 'About me',
                        bgColor: Colors.blue,
                        iconColor: Colors.green,
                        icon: Icons.person_outline,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return AboutMe();
                          }));
                        },
                      ),
                      const SizedBox(height: 20),
                      ProfileList(
                        title: 'work experience',
                        bgColor: Colors.red,
                        iconColor: Colors.green,
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
                        iconColor: Colors.green,
                        icon: Icons.school_outlined,
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return Education();
                          }));
                        },
                      ),
                      const SizedBox(height: 20),
                      ProfileList(
                        title: 'Skill',
                        bgColor: Colors.purple,
                        iconColor: Colors.green,
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
                        iconColor: Colors.green,
                        icon: Icons.verified_user_outlined,
                        onTap: () {
                         Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return Qualification();
                          }));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text('Talento'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
      ),
    );
  }
}
