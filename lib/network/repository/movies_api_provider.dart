import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:social/network/models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  Map<String, String> headers = {
    "user_email": "ank@ank.com",
    "user_password": "123456"
  };

  Future<ItemModel> fetchAllFeeds() async {
    print("API Called");
    final response = await client.post(
      "https://icbackend.herokuapp.com/fetch_latest_interview_posted", headers: headers);
    print(response.request.url);
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
