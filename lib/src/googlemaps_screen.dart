import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({super.key});

  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  late GoogleMapController mapController;

  final LatLng _center =
      const LatLng(37.7749, -122.4194); // Default center position
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      // Add markers when the map is created
      _markers.addAll([
        const Marker(
          markerId: MarkerId('marker_3'),
          position: LatLng(14.467354, 78.824135),
          infoWindow: InfoWindow(
            title: 'Kadapa',
            snippet: 'India',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
        const Marker(
          markerId: MarkerId('marker_4'),
          position: LatLng(17.385044, 78.486671),
          infoWindow: InfoWindow(
            title: 'Hyderabad',
            snippet: 'India',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
        // Add more markers as needed
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps in Flutter'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 10.0,
        ),
        markers: _markers,
      ),
    );
  }
}
