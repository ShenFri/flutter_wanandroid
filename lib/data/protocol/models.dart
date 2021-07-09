import 'package:azlistview/azlistview.dart';
import 'package:base_library/base_library.dart';
import 'package:flutter_agent_app/common/common.dart';
import 'package:flutter_agent_app/common/component_index.dart';


class BaseBean<T> {
  String _msg;
  String _code;
  T data;

  BaseBean(this._code,this._msg, this.data);

  get code => null;


  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"HEAD\":{\"MSG\":$_msg,"
    "\"CODE\":$_code}");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

class BaseReq<T> {
  T _body;
  BaseReq(this._body);
  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    var ACCOUNT_TYPE = Constant.accountType;
    var IP = "\"192.168.10.58\"";
    var VERSION = 1402;
    var TOKEN = "\"9MtidDn0Lh4OAVrF9JSqpXRG6bZZRfXAtwzkxZEsj5hSMUBS/YxZrtinVT5mJ3QFAxBfh2IDG2KMp5mV2blVWQ\u003d\u003d\"";
    var TYPE = 2;
    var MAC = "a4:93:3f:d7:bf:23";
    sb.write("\"HEAD\":{\"ACCOUNT_TYPE\":$ACCOUNT_TYPE,"
        "\"IP\":$IP,"
        "\"VERSION\":$VERSION,"
        "\"TOKEN\":$TOKEN,"
        "\"TYPE\":$TYPE,"
        "\"MAC\":\"$MAC\"}");
    sb.write(",\"BODY\":$_body");
    sb.write('}');
    return sb.toString();
  }
}


class REQ_MESSAGE {
  String req_message;

  REQ_MESSAGE(this.req_message);

  REQ_MESSAGE.fromJson(dynamic json){
    req_message = json["REQ_MESSAGE"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["REQ_MESSAGE"] = req_message;

    return map;
  }
  @override
  String toString() {
    return '{' +
        " \"REQ_MESSAGE\":\"" +
        req_message +
        "\""
        '}';
  }
}

class LoginReq {
  String username;
  String password;

  LoginReq(this.username, this.password);

  LoginReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() =>
      {
        'username': username,
        'password': password,
      };

  @override
  String toString() {
    return '{' +
        " \"username\":\"" +
        username +
        "\"" +
        ", \"password\":\"" +
        password +
        "\"" +
        '}';
  }
}

class LoginReq2 {
  String password;
  String accountType;
  String mobile;

  LoginReq2(this.password, this.accountType, this.mobile);

  LoginReq2.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    accountType = json['accountType'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['accountType'] = this.accountType;
    data['mobile'] = this.mobile;
    return data;
  }
}

class ComData {
  int size;
  List datas;

  ComData.fromJson(Map<String, dynamic> json)
      : size = json['size'],
        datas = json['datas'];
}

class ComReq {
  int cid;

  ComReq(this.cid);

  ComReq.fromJson(Map<String, dynamic> json) : cid = json['cid'];

  Map<String, dynamic> toJson() =>
      {
        'cid': cid,
      };
}

class ComListResp<T> {
  int status;
  List<T> list;

  ComListResp(this.status, this.list);
}

class ReposModel {
  int id;
  int originId;
  String title;
  String desc;
  String author;
  String link;
  String projectLink;
  String envelopePic;
  String superChapterName;
  int publishTime;
  bool collect;

  int type; //1项目，2文章
  bool isShowHeader;

  ReposModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        originId = json['originId'],
        title = json['title'],
        desc = json['desc'],
        author = json['author'],
        link = json['link'],
        projectLink = json['projectLink'],
        envelopePic = json['envelopePic'],
        superChapterName = json['superChapterName'],
        publishTime = json['publishTime'],
        collect = json['collect'],
        type = json['type'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'originId': originId,
        'title': title,
        'desc': desc,
        'author': author,
        'link': link,
        'projectLink': projectLink,
        'envelopePic': envelopePic,
        'superChapterName': superChapterName,
        'publishTime': publishTime,
        'collect': collect,
        'type': type,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"id\":$id");
    sb.write(",\"originId\":$originId");
    sb.write(",\"title\":\"$title\"");
    sb.write(",\"desc\":\"$desc\"");
    sb.write(",\"author\":\"$author\"");
    sb.write(",\"link\":\"$link\"");
    sb.write(",\"projectLink\":\"$projectLink\"");
    sb.write(",\"envelopePic\":\"$envelopePic\"");
    sb.write(",\"superChapterName\":\"$superChapterName\"");
    sb.write(",\"publishTime\":\"$publishTime\"");
    sb.write(",\"collect\":$collect");
    sb.write(",\"type\":$type");
    sb.write('}');
    return sb.toString();
  }
}

class BannerModel {
  String title;
  int id;
  String url;
  String imagePath;

  BannerModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        url = json['url'],
        imagePath = json['imagePath'];

  Map<String, dynamic> toJson() =>
      {
        'title': title,
        'id': id,
        'url': url,
        'imagePath': imagePath,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"title\":\"$title\"");
    sb.write(",\"id\":$id");
    sb.write(",\"url\":\"$url\"");
    sb.write(",\"imagePath\":\"$imagePath\"");
    sb.write('}');
    return sb.toString();
  }
}

class TreeModel extends ISuspensionBean {
  String name;
  int id;
  List<TreeModel> children;
  String tagIndex;

  TreeModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        id = json['id'],
        children = (json['children'] as List)
            ?.map((e) =>
        e == null
            ? null
            : new TreeModel.fromJson(e as Map<String, dynamic>))
            ?.toList();

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'id': id,
        'children': children,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"name\":\"$name\"");
    sb.write(",\"id\":$id");
    sb.write(",\"children\":$children");
    sb.write('}');
    return sb.toString();
  }

  @override
  String getSuspensionTag() {
    return tagIndex;
  }
}


class RegisterReq {
  String username;
  String password;
  String repassword;

  RegisterReq(this.username, this.password, this.repassword);

  RegisterReq.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'],
        repassword = json['repassword'];

  Map<String, dynamic> toJson() =>
      {
        'username': username,
        'password': password,
        'repassword': repassword,
      };

  @override
  String toString() {
    return '{' +
        " \"username\":\"" +
        username +
        "\"" +
        ", \"password\":\"" +
        password +
        "\"" +
        ", \"repassword\":\"" +
        repassword +
        "\"" +
        '}';
  }
}

class UserModel {
  String email;
  String icon;
  int id;
  String username;
  String password;

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        icon = json['icon'],
        id = json['id'],
        username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() =>
      {
        'email': email,
        'icon': icon,
        'id': id,
        'username': username,
        'password': password,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"email\":\"$email\"");
    sb.write(",\"icon\":\"$icon\"");
    sb.write(",\"id\":$id");
    sb.write(",\"username\":\"$username\"");
    sb.write(",\"password\":\"$password\"");
    sb.write('}');
    return sb.toString();
  }
}
