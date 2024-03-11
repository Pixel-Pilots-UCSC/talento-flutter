


import 'package:flutter/material.dart';

//prefered size widget for the app drawer
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  CustomAppBar({super.key,required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
        shadowColor: Colors.black54,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Container(
              height: 0.1,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF303C4E),
                    spreadRadius: 0.2,
                    blurRadius: 0.2,
                    offset: Offset(0, 1),
                  ),
                ],
                color: Color(0xFF303C4E),
              )
          ),
        )
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
