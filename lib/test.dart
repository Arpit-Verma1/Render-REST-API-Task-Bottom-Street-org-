
import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Welcome({
  required  this.id,
    required this.label,
    required this.chartPeriodCode,
    required this.changePercent,
  });

  int id;
  String label;
  String chartPeriodCode;
  double changePercent;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    id: json["ID"],
    label: json["Label"],
    chartPeriodCode: json["ChartPeriodCode"],
    changePercent: json["ChangePercent"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "Label": label,
    "ChartPeriodCode": chartPeriodCode,
    "ChangePercent": changePercent,
  };
}
