import 'dart:ffi';

import 'package:flutter/material.dart';

class SalaryRangeSelector extends StatefulWidget {
  @override
  _SalaryRangeSelectorState createState() => _SalaryRangeSelectorState();
}

class _SalaryRangeSelectorState extends State<SalaryRangeSelector> {
  double _minSalary = 10000.00;
  double _maxSalary = 100000.00;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(1, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          RangeSlider(
            values: RangeValues(_minSalary, _maxSalary),
            min: 10000,
            max: 100000,
            divisions: 10,
            labels: RangeLabels(
              '\Rs.${_minSalary.toStringAsFixed(0)}',
              '\Rs.${_maxSalary.toStringAsFixed(0)}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _minSalary = values.start;
                _maxSalary = values.end;
              });
            },
          ),
          SizedBox(width: 40.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.attach_money, color: Colors.white),
                SizedBox(width: 6),
                Text(
                  'Selected Range: \Rs. ${_minSalary.toStringAsFixed(0)} - \Rs. ${_maxSalary.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
