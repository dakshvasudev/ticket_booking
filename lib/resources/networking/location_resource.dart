import 'package:dio/dio.dart';

class LocationResource {
  final Dio _dio = Dio();

  Future<List<String>> getPlaces(String query) async {
    try {
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/textsearch/json',
        queryParameters: {
          'query': query,
          'key': 'AIzaSyCjOWuul-db69IzI90Wk2VH1t0z1FeFI0s',
        },
      );

      if (response.statusCode == 200) {
        final results = response.data['results'] as List<dynamic>;
        final places =
            results.map((result) => result['name'] as String).toList();
        return places;
      } else {
        throw Exception('Failed to fetch places');
      }
    } catch (e) {
      throw Exception('Failed to fetch places: $e');
    }
  }
}
