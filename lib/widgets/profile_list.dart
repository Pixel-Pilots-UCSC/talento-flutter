// import 'package:account_example/widgets/arrow_button.dart';
import 'package:flutter/material.dart';

class ProfileList extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final IconData icon;
  final Function() onTap;
  final String? value;
  const ProfileList({
    super.key,
    required this.title,
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    required this.onTap,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
          // backgroundColor: Theme.of(context).colorScheme.background;

    return Padding(
      padding: const EdgeInsets.only(right: 30.0, left: 30.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        // color: bgColor,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 12.0, left: 12, top: 8, bottom: 8),
                child: Container(
                  height: 55,
                  width: 20,
                  child: Icon(
                    icon,
                    color: iconColor,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              value != null
                  ? Text(
                      value!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  : const SizedBox(),
              // const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF3EB489),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
