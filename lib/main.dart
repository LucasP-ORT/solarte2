
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:myapp/totem_chart_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solarte',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(-34.60638889, -58.43555556),
        child: GestureDetector(
          onTap: () {
            _showTotemPopup();
          },
          child: const Icon(
            Icons.location_on,
            color: Colors.orange,
            size: 40.0,
          ),
        ),
      ),
    );
    _markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(-34.61813889, -58.43327778),
        child: GestureDetector(
          onTap: () {
            _showTotemPopup();
          },
          child: const Icon(
            Icons.location_on,
            color: Colors.orange,
            size: 40.0,
          ),
        ),
      ),
    );
    _markers.add(
      Marker(
        width: 80.0,
        height: 80.0,
        point: LatLng(-34.61447222, -58.45777778),
        child: GestureDetector(
          onTap: () {
            _showTotemPopup();
          },
          child: const Icon(
            Icons.location_on,
            color: Colors.orange,
            size: 40.0,
          ),
        ),
      ),
    );
  }

  void _showTotemPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const TotemChartPopup();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solarte'),
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-34.60, -58.43),
          initialZoom: 13.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerLayer(markers: _markers),
        ],
      ),
    );
  }
}
