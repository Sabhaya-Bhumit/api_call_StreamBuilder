import 'dart:convert';

import 'package:api_call/modal/data.dart';
import 'package:http/http.dart' as http;

class DataAPIHelp {
  DataAPIHelp._();
  static final DataAPIHelp dataAPIHelp = DataAPIHelp._();

  Future<List<DataModal>?> fetchData() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      List jsondata = jsonDecode(res.body);
      List<DataModal> list =
          jsondata.map((e) => DataModal.FromMap(data: e)).toList();
      return list;
    }
    return null;
  }
}
