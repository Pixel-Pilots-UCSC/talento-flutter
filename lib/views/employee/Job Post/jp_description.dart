import 'package:flutter/material.dart';

  Widget buildDropdown(String label, List<String> items) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey.withOpacity(0.5),
          //   spreadRadius: 0.1,
          //   blurRadius: 5,
          //   offset: Offset(0, 1), // changes position of shadow
          // ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            isDense: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: label,
                labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(1),
                  borderSide: BorderSide.none,
                )),
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              // Handle value change
            },
          ),
        ),
      ),
    ),
  );
}

Widget buildTextFormField(String label) {
  return Center(
    child: Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        boxShadow: [
          // BoxShadow(
          //   color: Colors.grey.withOpacity(0.5),
          //   spreadRadius: 0.1,
          //   blurRadius: 5,
          //   offset: Offset(0, 1), // changes position of shadow
          // ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: label,
              labelStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(1),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}


