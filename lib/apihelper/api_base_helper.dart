import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'api_exception.dart';

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 201:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      return json.decode(response.body.toString());
    case 401:
    case 403:
      return json.decode(response.body.toString());
    case 500:
    default:
      return FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}

class ApiBaseHelper {
  Future<dynamic> delete(String url) async {
    var apiResponse;
    try {
      final response = await http.delete(Uri.parse(url));
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return apiResponse;
  }

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    var responseJson;
    try {
      final response = await http.put(Uri.parse(url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }
}

/*

void uploadImage() async {
    _showLoader();
    var uri = Uri.parse(URLEndPoints.img_upload_url);
    var imageModel = new ImageUploadResponse();
    http.MultipartRequest request = http.MultipartRequest('POST', uri);
    Map<String, String> headers = {
      "authType": "Zeemart",
      "Content-type": "multipart/form-data",
      "supplierId": supplierID,
      "mudra": mudra
    };
    request.headers.addAll(headers);
    request.fields.addAll({"componentType": "PROFILE"});

    request.files.add(await http.MultipartFile(
      'multipartFiles',
      _image.readAsBytes().asStream(),
      _image.lengthSync(),
      filename: basename(_image.path),
      contentType: MediaType('image', 'jpeg'),
    ));
    print("request: " + request.toString());
    // var imgUploadResponse = await request.send();
    http.Response imgUploadResponse =
        await http.Response.fromStream(await request.send());
    print("response" + imgUploadResponse.statusCode.toString());
    imageModel =
        ImageUploadResponse.fromJson(json.decode(imgUploadResponse.body));
    String fileUrl = imageModel.data.lstFiles.elementAt(0).fileUrl;
    if (fileUrl.isNotEmpty) {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'authType': 'Zeemart',
        'mudra': mudra,
        'supplierId': supplierID
      };
      Map<String, String> queryParams = {'supplierId': supplierID};
      String queryString = Uri(queryParameters: queryParams).query;
      var requestUrl = URLEndPoints.get_specific_user_url + '?' + queryString;
      final msg = jsonEncode({'logoURL': fileUrl, 'supplierId': supplierID});
      var response = await http.put(requestUrl, headers: headers, body: msg);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        UpdateImageView(fileUrl);
      } else {
        _hideLoader();
      }
    } else {
      _hideLoader();
    }
  }

*/
