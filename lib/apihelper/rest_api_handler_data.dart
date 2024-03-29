import 'package:happy/apihelper/api_base_helper.dart';
import 'package:happy/model/art_works_model.dart';
import 'package:happy/model/youtube_model.dart';

class RestApiHandlerData {
  static final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();
  static getData(String path) async {
    final response = await _apiBaseHelper.get(path);
    return response;
  }

  static postData(String path, dynamic body) async {
    final response = await _apiBaseHelper.post(path, body);
    return response;
  }

  static Future<List<ArtWorksModel>> getArtWorksData(String path) async {
    final response = await _apiBaseHelper.get(path);
    final results = response['data'] as List<dynamic>;
    final artWorks = results.map((e) {
      return ArtWorksModel.fromMap(e);
    }).toList();
    return artWorks;
  }

  static Future<List<YoutubeModel>> getYouTubeData(String path) async {
    final response = await _apiBaseHelper.get(path);
    final results = response as List<dynamic>;
    final youtube = results.map((e) {
      return YoutubeModel.fromMap(e);
    }).toList();
    return youtube;
  }
}
