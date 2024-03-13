import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talento/models/location_model.dart';
import 'package:talento/themes/theme_data.dart';
import 'package:talento/views/employee/Job%20Post/jp_description.dart';
import 'package:talento/views/employee/Job%20Post/jp_location.dart';
import 'package:talento/views/employee/Job%20Post/jp_salary.dart';

class JobPostForm extends StatefulWidget {
  const JobPostForm({super.key});

  @override
  _JobPostFormState createState() => _JobPostFormState();
}

class _JobPostFormState extends State<JobPostForm> {
  final locationModel =
      LocationModel(['Location 1', 'Location 2', 'Location 3']);
  final _stepsText = ["Description", "Location", "Salary", "Details"];

  final _stepCircleRadius = 5.0;

  final _stepProgressViewHeight = 5.0;

  final Color _activeColor = Themes.lightTheme.primaryColor;

  final Color _inactiveColor = Colors.grey;

  final TextStyle _headerStyle =
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);

  final TextStyle _stepStyle =
      const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);

  late Size _safeAreaSize;

  int _curPage = 1;

  StepProgressView _getStepProgress() {
    return StepProgressView(
      _stepsText,
      _curPage,
      _stepProgressViewHeight,
      _safeAreaSize.width,
      _stepCircleRadius,
      _activeColor,
      _inactiveColor,
      _headerStyle,
      _stepStyle,
      decoration: BoxDecoration(color: Colors.transparent),
      padding: const EdgeInsets.only(
        top: 10.0,
        left: 24.0,
        right: 24.0,
      ),
    );
  }

  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    _safeAreaSize = mediaQD.size;
    var _pageController = PageController(initialPage: _curPage - 1);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Job Post",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
              )),
        ),
        body: Column(
          children: <Widget>[
            Container(height: 80.0, child: _getStepProgress()),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) {
                  setState(() {
                    _curPage = i + 1;
                  });
                },
                children: <Widget>[
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          buildDropdown('Industry',
                              ['Industry 1', 'Industry 2', 'Industry 3']),
                          SizedBox(height: 2),
                          buildDropdown('Category',
                              ['Category 1', 'Category 2', 'Category 3']),
                          SizedBox(height: 2),
                          buildTextFormField("Job Position"),
                          SizedBox(height: 2),
                          buildDropdown(
                              'Job Type', ['Type 1', 'Type 2', 'Type 3']),
                          SizedBox(height: 2),
                          buildDropdown('Workspace Type',
                              ['Workspace 1', 'Workspace 2', 'Workspace 3']),
                          SizedBox(height: 80),
                          nextBtnEmp(_pageController)
                        ],
                      ),
                    ),
                  ),
                  Container(child: LocationPage(locationModel: locationModel)),
                  Container(
                      child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SalaryRangeSelector(),
                          SizedBox(height: 80),
                          nextBtnEmp(_pageController)
                        ],
                      ),
                    ),
                  )),
                  Container(
                    color: Colors.red,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  Padding nextBtnEmp(PageController _pageController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 8.0),
      child: SizedBox(
        height: 50,
        // width: 50,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _pageController.animateToPage(
                _curPage,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            });
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}

class StepProgressView extends StatelessWidget {
  const StepProgressView(
    List<String> stepsText,
    int curStep,
    double height,
    double width,
    double dotRadius,
    Color activeColor,
    Color inactiveColor,
    TextStyle headerStyle,
    TextStyle stepsStyle, {
    Key? key,
    required this.decoration,
    required this.padding,
    this.lineHeight = 2.0,
  })  : _stepsText = stepsText,
        _curStep = curStep,
        _height = height,
        _width = width,
        _dotRadius = dotRadius,
        _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _headerStyle = headerStyle,
        _stepStyle = stepsStyle,
        assert(curStep > 0 == true && curStep <= stepsText.length),
        assert(width > 0),
        // assert(height >= 2 * dotRadius),
        assert(width >= dotRadius * 2 * stepsText.length),
        super(key: key);

  //height of the container
  final double _height;
  //width of the container
  final double _width;
  //container decoration
  final BoxDecoration decoration;
  //list of texts to be shown for each step
  final List<String> _stepsText;
  //cur step identifier
  final int _curStep;
  //active color
  final Color _activeColor;
  //in-active color
  final Color _inactiveColor;
  //dot radius
  final double _dotRadius;
  //container padding
  final EdgeInsets padding;
  //line height
  final double lineHeight;
  //header textstyle
  final TextStyle _headerStyle;
  //steps text
  final TextStyle _stepStyle;

  List<Widget> _buildDots() {
    var wids = <Widget>[];
    _stepsText.asMap().forEach((i, text) {
      var circleColor =
          (i == 0 || _curStep >= i + 1) ? _activeColor : _inactiveColor;

      // var lineColor = _curStep > i + 1 ? _activeColor : _inactiveColor;

      wids.add(CircleAvatar(
        radius: _dotRadius,
        backgroundColor: circleColor,
      ));

      //add a line separator
      //0-------0--------0
      if (i != _stepsText.length - 1) {
        wids.add(SizedBox(
          width: 10,
        )
            // Expanded(
            //   child: Container(
            //     height: lineHeight,
            //     color: lineColor,
            //   ),
            // ),
            );
      }
    });

    return wids;
  }

  // List<Widget> _buildText() {
  //   var wids = <Widget>[];
  //   _stepsText.asMap().forEach((i, text) {
  //     wids.add(Text(text, style: _stepStyle));
  //   });

  //   return wids;
  // }

  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: this._height,
      width: this._width,
      decoration: this.decoration,
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildDots(),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: _stepsText.elementAt(_curStep - 1),
                      style: _headerStyle.copyWith(
                        color: Colors.black, //this is always going to be active
                      ),
                    ),
                    // TextSpan(
                    //   text: (_curStep).toString(),
                    //   style: _headerStyle.copyWith(
                    //     color: _activeColor, //this is always going to be active
                    //   ),
                    // ),
                    // TextSpan(
                    //   text: " / " + _stepsText.length.toString(),
                    //   style: _headerStyle.copyWith(
                    //     color: _curStep == _stepsText.length
                    //         ? _activeColor
                    //         : _inactiveColor,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: _buildText(),
            // )
          ],
        ),
      ),
    );
  }
}
