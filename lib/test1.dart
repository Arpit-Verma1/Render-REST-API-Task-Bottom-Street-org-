import 'dart:convert';

class Welcome1 {
  Welcome1({
 required this.id,
  required this.security,
    required this.industryId,
    required this.industry,
    required this.sectorId,
    required this.sector,
    required this.mcap,
    required this.ev,
    required this.evDateEnd,
    required this.bookNavPerShare,
    required this.ttmpe,
    required this.ttmYearEnd,
    required this.welcome1Yield,
    required this.yearEnd,
    required this.sectorSlug,
    required this.industrySlug,
    required this.securitySlug,
    required this.pegRatio,
  });

  int id;
  String security;
  int industryId;
  String industry;
  int sectorId;
  String sector;
  double mcap;
  dynamic ev;
  dynamic evDateEnd;
  double bookNavPerShare;
  double ttmpe;
  int ttmYearEnd;
  double welcome1Yield;
  int yearEnd;
  String sectorSlug;
  String industrySlug;
  String securitySlug;
  double pegRatio;

  factory Welcome1.fromJson(Map<String, dynamic> json) => Welcome1(
    id: json["ID"],
    security: json["Security"],
    industryId: json["IndustryID"],
    industry: json["Industry"],
    sectorId: json["SectorID"],
    sector: json["Sector"],
    mcap: json["MCAP"].toDouble(),
    ev: json["EV"],
    evDateEnd: json["EVDateEnd"],
    bookNavPerShare: json["BookNavPerShare"].toDouble(),
    ttmpe: json["TTMPE"].toDouble(),
    ttmYearEnd: json["TTMYearEnd"],
    welcome1Yield: json["Yield"].toDouble(),
    yearEnd: json["YearEnd"],
    sectorSlug: json["SectorSlug"],
    industrySlug: json["IndustrySlug"],
    securitySlug: json["SecuritySlug"],
    pegRatio: json["PEGRatio"].toDouble(),
  );


}
