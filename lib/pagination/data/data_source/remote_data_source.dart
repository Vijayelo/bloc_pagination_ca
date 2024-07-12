import 'dart:convert';

import 'package:http/http.dart';
import 'package:bloc_demo/core/handle_error/execptions.dart';

import '../model/post.dart';

abstract class RemoteData {
  Future<List<Datum>> getData(
      {required int pageNumber, required int numberOfPostsPerRequest});
}

class RemoteDataImpl extends RemoteData {
  @override
  Future<List<Datum>> getData(
      {required int pageNumber, required int numberOfPostsPerRequest}) async {
    final response = await get(Uri.parse(
        "https://reqres.in/api/users?page=$pageNumber&per_page=$numberOfPostsPerRequest"));
    try {
      List responseList = json.decode(response.body)['data'];
      List<Datum> postList = responseList
          .map((data) => Datum(data['id'], data['email'], data['first_name'],
              data['last_name'], data['avatar']))
          .toList();
      return postList;
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
