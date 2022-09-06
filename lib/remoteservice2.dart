import 'dart:convert';

import 'package:project3/test1.dart';
import 'package:http/http.dart' as http;


Future<Welcome1> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en'));

  if (response.statusCode == 200) {

    return Welcome1.fromJson(jsonDecode(response.body));
  } else {

    throw Exception('Failed to load album');
  }
}