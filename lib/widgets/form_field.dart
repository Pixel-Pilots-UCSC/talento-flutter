import 'package:flutter/material.dart';

class FormField extends StatelessWidget {
  final String title;
  final String hintText; // Change hintText type to String
  
  const FormField({
    Key? key, // Change super.key to Key? key
    required this.title,
    required this.hintText,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              )),
        ),
        const SizedBox(height: 6),
        Padding(
          padding:const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), 
                ),
              ],
            ),
            child: Padding(
              
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                
                decoration: InputDecoration(
                  
                  border: InputBorder.none,
                  hoverColor: Colors.grey,
                  hintText: hintText,
                  hintStyle:const  TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
