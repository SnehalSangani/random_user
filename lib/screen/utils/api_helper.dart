import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user/screen/home/model/home_Model.dart';
class Apihelper
{
  Future<RandomPerson> randomapi()
  async {
    String link="https://randomuser.me/api/";
    Uri uri=Uri.parse(link);
    var response=await http.get(uri);
    var randomjson=jsonDecode(response.body);
    return RandomPerson.fromJson(randomjson);

  }
}