import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/modelClass.dart';
import '../utils/app_str.dart';

class ApiController {

  Future<GetNewsDataModel> getNews() async {
    final response = await http.get(Uri.parse('${AppStrings.baseUrl}?q=tesla&from=2024-01-16&sortBy=publishedAt&apiKey=${AppStrings.apiKey}'));
    if (response.statusCode == 200) {
      return GetNewsDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Weather Data');
    }
  }
}
