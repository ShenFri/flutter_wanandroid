class REQ_MESSAGE_BEAN {
  String reqmessage;

  REQ_MESSAGE_BEAN({
      this.reqmessage});

  REQ_MESSAGE_BEAN.fromJson(dynamic json) {
    reqmessage = json["REQ_MESSAGE"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["REQ_MESSAGE"] = reqmessage;
    return map;
  }

}