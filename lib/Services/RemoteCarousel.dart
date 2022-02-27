// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:news_app/Models/CarouselData.dart';

class RemoteCarousel {
  var client = http.Client();
  String url =
      "https://newsapi.org/v2/everything?q=apple&from=2022-02-24&to=2022-02-24&sortBy=popularity&apiKey=6e109140efd34a0d805afe229f95f4b4";

  Future<dynamic> fetchCarouselData() async {
    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return carouselDataFromJson(response.body);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
