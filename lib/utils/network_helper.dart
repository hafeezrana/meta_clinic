import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  static Future<dynamic> post({required String url, body, headers}) async {
    var uri = Uri.parse(url);
    print(url);
    final response = await http
        .post(uri, body: body, headers: headers)
        .timeout(const Duration(seconds: 15), onTimeout: () {
      throw "Request time out";
    });

    print("status : ${response.statusCode}");
    final jsonData = jsonDecode(response.body);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return jsonData;
      // } else {
      //   throw jsonData['message'] ?? jsonData;
      // }
    } else {
      return null;
    }
  }

  static Future<dynamic> put({required String url, body, headers}) async {
    var uri = Uri.parse(url);
    print(url);
    final response = await http
        .put(uri, body: body, headers: headers)
        .timeout(const Duration(seconds: 5), onTimeout: () {
      throw "Request time out";
    });
    // print("response : ${response.body}");
    // print("status : ${response.statusCode}");
    final jsonData = jsonDecode(response.body);
    debugPrint(response.body);
    if (response.statusCode == 200) {
      return jsonData;
      // } else {
      //   throw jsonData['message'] ?? jsonData;
      // }
    } else {
      return null;
    }
  }

  static Future<dynamic> get(
      {required String url, Map<String, dynamic>? queryParams, headers}) async {
    var uri = Uri.parse(url).replace(queryParameters: queryParams);
    print(uri);
    final response = await http
        .get(uri, headers: headers)
        .timeout(const Duration(seconds: 15), onTimeout: () {
      throw "Request time out";
    });
    print("response: ${response.body}");
    final jsonData = jsonDecode(response.body);
    // ApiUtils.printResponse(response);
    if (response.statusCode == 200) {
      // if (jsonData['status'] == "Success") {
      return jsonData;
      // } else {
      //   throw jsonData['message'] ?? jsonData;
      // }
    } else {
      print('Get api fail');
      // return null;
    }
  }

  static Future<dynamic> uploadFile({
    required String url,
    required File file,
    String fieldName = "file",
  }) async {
    var uri = Uri.parse(url);
    print(url);

    var request = http.MultipartRequest('POST', uri);

    var fileStream = http.ByteStream(file.openRead());
    var length = await file.length();
    var multipartFile =
        http.MultipartFile(fieldName, fileStream, length, filename: file.path);

    // if (headers != null) {
    //   request.headers.addAll(headers);
    // }
    //
    // if (body != null) {
    //   request.fields.addAll(body);
    // }

    request.files.add(multipartFile);

    final response = await request.send().timeout(
      const Duration(seconds: 5),
      onTimeout: () {
        throw "Request time out";
      },
    );

    final responseJson = await response.stream.bytesToString();
    print(responseJson);
    print(responseJson);

    if (response.statusCode == 200) {
      return jsonDecode(responseJson);
    } else {
      return null;
    }
  }

  static Future multipartRequest(
      String url, Map<String, String> body, String methodName,
      {Map<String, String>? header, File? image, String? imageKey}) async {
    var client = http.Client();
    try {
      String fullURL = url;

      // log('API body: $body');
      // log('API header: $header');

      var request = http.MultipartRequest(methodName, Uri.parse(fullURL));
      request.headers.addAll(header!);
      request.fields.addAll(body);
      if (image != null) {
        request.files.add(
            await http.MultipartFile.fromPath(imageKey!, image.absolute.path));
      }

      http.StreamedResponse response = await request.send();

      // print('Response status: ${response.statusCode}');

      String jsonDataString = await response.stream.bytesToString();
      final jsonData = jsonDecode(jsonDataString);

      // if (jsonData["status"] == "Fail") {
      //   throw AppException(message: jsonData['message'], errorCode: 0);
      // }

      return jsonData;
    } catch (exception) {
      client.close();
      rethrow;
    }
  }
}
