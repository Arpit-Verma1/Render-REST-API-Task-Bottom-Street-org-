import 'dart:convert';

import 'package:project3/test.dart';
import 'package:http/http.dart' as http;
import 'package:project3/test1.dart';
class remote{
  Future<List<Welcome>?>get()async{
    var client=http.Client();
    var uri=Uri.parse(
        "https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en");
    var response=await client.get(uri);
    if(response.statusCode==200){
      var json=response.body;
      return welcomeFromJson(json);
    }

  }

}