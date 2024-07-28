import 'dart:convert';

import 'package:data_flow/Models/world_stats_model.dart';
import 'package:data_flow/Services/Utlities/app_url.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatsModel> getWorldStats() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStatsModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
