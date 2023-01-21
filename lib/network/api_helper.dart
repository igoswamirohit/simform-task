// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:chopper/chopper.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import '../utility/api_constants.dart';

const GET = 'GET';
const POST = 'POST';
const PUT = 'PUT';
const DELETE = 'DELETE';
const PATCH = 'PATCH';

abstract class OutSideWorld {
  Future<Response> request<T>(
      {required String url,
      String? baseUrl,
      required String method,
      Map<String, dynamic>? body,
      Map<String, String>? headers,
      Map<String, dynamic>? params,
      bool removeDefaultHeaders = false});
}

class LinkToOutSideWorld extends OutSideWorld {
  final client =
      ChopperClient(baseUrl: Uri.parse(ApiConstants.baseUrl), interceptors: [
    HttpLoggingInterceptor(),
  ]);

  @override
  Future<Response> request<T>(
      {required String url,
      String? baseUrl,
      required String method,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? params,
      bool showLoader = false,
      bool removeDefaultHeaders = false,
      bool? isMultipart,
      List<PartValue>? partValue}) async {
    // var token = await DbSecureStorage.getToken();

    // final defaultHeaders = headers?.cast<String, String>() ?? {};
    // if (token != null && token.isNotEmpty) {
    //   defaultHeaders.addAll({'Authorization': 'Bearer $token'});
    // }

    // if (!removeDefaultHeaders) {
    //   defaultHeaders.addAll({
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //   });
    // }

    // if (showLoader) {
    //   getx.Get.dialog(const SpinKitWave(color: Colors.blue),
    //       barrierDismissible: false);
    // }

    final baseUri = baseUrl != null ? Uri.parse(baseUrl) : client.baseUrl;

    final request = Request(method, Uri.parse(url), baseUri,
        // headers: defaultHeaders,
        parameters: params ?? {},
        body: body,
        multipart: isMultipart ?? false,
        parts: partValue ?? []);

    Response? response;

    try {
      response = await client
          .send<dynamic, dynamic>(request)
          .timeout(const Duration(seconds: 18))
          .onError((error, stackTrace) {
        HapticFeedback.heavyImpact();

        // if (response != null) pushToLogin(response);

        return Response(
            http.Response(
                error != null
                    ? '{"error":${error.toString()}}'
                    : '{"error":"Something went wrong!"}',
                500),
            const {"error": "Something went wrong!"});
      });
    } catch (e) {
      log(e.toString());

      HapticFeedback.heavyImpact();
      // if (showLoader) {
      //   getx.Get.back();
      // }

      return Response(http.Response('{"error":${e.toString()}}', 500),
          const {"error": "Something went wrong!"});
    }

    if (response.error != null && response.error != "") {
      HapticFeedback.heavyImpact();
      // pushToLogin(response);
    }

    // if (showLoader) {
    //   getx.Get.back();
    // }

    return response;
  }
}
