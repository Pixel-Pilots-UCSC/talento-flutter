import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talento/models/location_model.dart';

class LocationPage extends StatefulWidget {
  final LocationModel locationModel;

  LocationPage({required this.locationModel});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String _selectedLocation = '';
  String _searchText = '';
  List<String> _filteredLocations = [];

  void _filterLocations(String query) {
    setState(() {
      _searchText = query;
      _filteredLocations = widget.locationModel.locations
          .where((location) =>
              location.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(1, 4), // changes position of shadow
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a location',
                  prefixIcon: Icon(Icons.search_outlined, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  
                ),
                onChanged: _filterLocations,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredLocations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_filteredLocations[index]),
                    onTap: () {
                      setState(() {
                        _searchText = _filteredLocations[index];
                        _selectedLocation = _filteredLocations[index];
                      });
                      // Handle selection
                      print('Selected Location: $_selectedLocation');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
