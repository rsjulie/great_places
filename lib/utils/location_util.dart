import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyBI6QMEKU6jxG2tyji1mqt8J2rylGJ0GtY';

class LocationUtil {
  static String generateLocationPreview({double? latitude, double? longitude}) {
    // return 'https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyBI6QMEKU6jxG2tyji1mqt8J2rylGJ0GtY';
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=18&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getAdressFrom(LatLng position) async {
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$GOOGLE_API_KEY');
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
