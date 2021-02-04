import 'dart:math';
import 'package:dio/dio.dart';
import 'package:knox/core/resources/dio_wrapper.dart';

class Helpers {
  Random rand = Random();

  /// Generate random string with given `length`.
  String randomString(int len) {
    List<String> chars = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    String generate = '';

    for (var i = 0; i < len; i++) {
      generate += rand.nextBool() ? chars[rand.nextInt(chars.length)] : chars[rand.nextInt(chars.length)].toUpperCase();
    }

    return generate;
  }

  /// Grab the favicon of the website with the specified `url`.
  Future grabFavicon(String url) async {
    String icon;

    try {
      Response response = await dioWrapper.get("http://favicongrabber.com/api/grab/$url");

      if (response.statusCode == 200) {
        var data = response.data;
        icon = (data['icons'] as List).firstWhere((icon) => !icon['src'].endsWith('svg'))['src'];
      }
    } on DioError catch (e) {
      print("Error while fetching favicon: ${e.message}");
    }

    return icon;
  }
}

Helpers helpers = Helpers();
