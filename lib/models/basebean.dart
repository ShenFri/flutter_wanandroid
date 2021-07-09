import 'package:jaguar_serializer/jaguar_serializer.dart';

/// HEAD : {"MSG":"操作成功","CODE":"000"}
/// BODY : {"PARAM":{"T":0,"TP":0,"M":1,"N":10},"ROWS":[]}

class Basebean {
  HEAD _head;
  BODY _body;

  HEAD get head => _head;
  BODY get body => _body;

  Basebean({
      HEAD head,
      BODY body}){
    _head = head;
    _body = body;
}

  Basebean.fromJson(dynamic json) {
    _head = json["HEAD"] != null ? HEAD.fromJson(json["HEAD"]) : null;
    _body = json["BODY"] != null ? BODY.fromJson(json["BODY"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_head != null) {
      map["HEAD"] = _head.toJson();
    }
    if (_body != null) {
      map["BODY"] = _body.toJson();
    }
    return map;
  }

}

/// PARAM : {"T":0,"TP":0,"M":1,"N":10}
/// ROWS : []

class BODY {
  PARAM _param;
  List<dynamic> _rows;

  PARAM get param => _param;
  List<dynamic> get rows => _rows;

  BODY({
      PARAM param,
      List<dynamic> rows}){
    _param = param;
    _rows = rows;
}

  BODY.fromJson(dynamic json) {
    _param = json["PARAM"] != null ? PARAM.fromJson(json["PARAM"]) : null;
    if (json["ROWS"] != null) {
      _rows = [];
      json["ROWS"].forEach((v) {
        _rows.add(dynamic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_param != null) {
      map["PARAM"] = _param.toJson();
    }
    if (_rows != null) {
      map["ROWS"] = _rows.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// T : 0
/// TP : 0
/// M : 1
/// N : 10

class PARAM {
  int _t;
  int _tp;
  int _m;
  int _n;

  int get t => _t;
  int get tp => _tp;
  int get m => _m;
  int get n => _n;

  PARAM({
      int t,
      int tp,
      int m,
      int n}){
    _t = t;
    _tp = tp;
    _m = m;
    _n = n;
}

  PARAM.fromJson(dynamic json) {
    _t = json["T"];
    _tp = json["TP"];
    _m = json["M"];
    _n = json["N"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["T"] = _t;
    map["TP"] = _tp;
    map["M"] = _m;
    map["N"] = _n;
    return map;
  }

}

/// MSG : "操作成功"
/// CODE : "000"

class HEAD {
  String _msg;
  String _code;

  String get msg => _msg;
  String get code => _code;

  HEAD({
      String msg, 
      String code}){
    _msg = msg;
    _code = code;
}

  HEAD.fromJson(dynamic json) {
    _msg = json["MSG"];
    _code = json["CODE"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["MSG"] = _msg;
    map["CODE"] = _code;
    return map;
  }

}