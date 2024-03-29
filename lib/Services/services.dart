import 'dart:convert';
import 'package:happy/model/art_works_model.dart';
import 'package:http/http.dart' as http;

class NetWorkManager {
  static Future<List<ArtWorksModel>> fetchDetailsFromServer() async {
    const url = 'https://api.artic.edu/api/v1/artworks';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['data'] as List<dynamic>;
    final artWorks = results.map((e) {
      return ArtWorksModel(
        title: e['title'],
        //timestamp: e['timestamp'],
      );
    }).toList();
    return artWorks;
  }
}

class Authentication {
  static Future<String> postData() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/posts';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "title": "Raghava",
          "body": "I Love Happy",
          "userId": 1,
          // Add any other data you want to send in the body
        }),
      );

      if (response.statusCode == 201) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);
        // String result = '';

        return 'ID: ${responseData['id']}\nName: ${responseData['name']}\nEmail: ${responseData['email']}';
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
